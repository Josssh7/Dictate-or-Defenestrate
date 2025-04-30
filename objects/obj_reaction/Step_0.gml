y -= 1;
image_xscale -= scale_decay;
image_yscale -= scale_decay;
image_alpha -= alpha_decay;

if (image_alpha <= 0) instance_destroy();