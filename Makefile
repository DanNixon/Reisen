out_dir = ./rendered

dxf_options = -D 'res=800'
full_image_options = -D 'res=200' --imgsize=1000,1000
thumb_image_options = -D 'res=200' --imgsize=250,250

camera_front = --camera=0,0,30,65,0,140,1000
camera_rear = --camera=0,0,30,65,0,330,1000

all: all_parts assembly_image assembly_image_thumb

all_parts: bottom top left_side right_side lens_panel screen_divider device_panel lens_clip magnet_guide magnet_guide_top

clean:
	rm -r $(out_dir)

output_folder:
	mkdir -p $(out_dir)

assembly_image_thumb: output_folder
	openscad assembly.scad $(thumb_image_options) $(camera_rear) -o $(out_dir)/assembly_rear_thumb.png
	openscad assembly.scad $(thumb_image_options) $(camera_front) -o $(out_dir)/assembly_front_thumb.png

assembly_image: output_folder
	openscad assembly.scad $(render_options) $(camera_rear) -o $(out_dir)/assembly_rear.png
	openscad assembly.scad $(render_options) $(camera_front) -o $(out_dir)/assembly_front.png

bottom: output_folder
	openscad parts/bottom.scad $(dxf_options) -o $(out_dir)/bottom.dxf

top: output_folder
	openscad parts/top.scad $(dxf_options) -o $(out_dir)/top.dxf

left_side: output_folder
	openscad parts/left_side.scad $(dxf_options) -o $(out_dir)/left_side.dxf

right_side: output_folder
	openscad parts/right_side.scad $(dxf_options) -o $(out_dir)/right_side.dxf

lens_panel: output_folder
	openscad parts/lens_panel.scad $(dxf_options) -o $(out_dir)/lens_panel.dxf

screen_divider: output_folder
	openscad parts/screen_divider.scad $(dxf_options) -o $(out_dir)/screen_divider.dxf

device_panel: output_folder
	openscad parts/device_panel.scad $(dxf_options) -o $(out_dir)/device_panel.dxf

lens_clip: output_folder
	openscad parts/lens_clip.scad $(dxf_options) -o $(out_dir)/lens_clip.dxf

magnet_guide: output_folder
	openscad parts/magnet_guide.scad $(dxf_options) -o $(out_dir)/magnet_guide.dxf

magnet_guide_top: output_folder
	openscad parts/magnet_guide_top.scad $(dxf_options) -o $(out_dir)/magnet_guide_top.dxf
