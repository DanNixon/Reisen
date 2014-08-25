out_dir = ./rendered
dxf_options = -D 'res=800'
render_options = -D 'res=200' --imgsize=1000,1000

all: all_parts

all_parts: bottom top left_side right_side lens_holder screen_divider device_panel

clean:
	rm -rf $(out_dir)

output_folder:
	mkdir -p $(out_dir)

assembly_image_thumb: output_folder
	openscad assembly.scad --imgsize=200,200 --camera=0,0,30,65,0,330,1000 -o $(out_dir)/assembly_rear_thumb.png
	openscad assembly.scad --imgsize=200,200 --camera=0,0,30,65,0,140,1000 -o $(out_dir)/assembly_front_thumb.png

assembly_image: output_folder
	openscad assembly.scad $(render_options) --camera=0,0,30,65,0,330,1000 -o $(out_dir)/assembly_rear.png
	openscad assembly.scad $(render_options) --camera=0,0,30,65,0,140,1000 -o $(out_dir)/assembly_front.png

bottom: output_folder
	openscad parts/bottom.scad $(dxf_options) -o $(out_dir)/bottom.dxf

top: output_folder
	openscad parts/top.scad $(dxf_options) -o $(out_dir)/top.dxf

left_side: output_folder
	openscad parts/left_side.scad $(dxf_options) -o $(out_dir)/left_side.dxf

right_side: output_folder
	openscad parts/right_side.scad $(dxf_options) -o $(out_dir)/right_side.dxf

lens_holder: output_folder
	openscad parts/lens_holder.scad $(dxf_options) -o $(out_dir)/lens_holder.dxf

screen_divider: output_folder
	openscad parts/screen_divider.scad $(dxf_options) -o $(out_dir)/screen_divider.dxf

device_panel: output_folder
	openscad parts/device_panel.scad $(dxf_options) -o $(out_dir)/device_panel.dxf
