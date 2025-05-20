randomise();
var _article = articles[irandom(array_length(articles)-1)];

//Create Title
instance_create_layer(room_width*0.5, 450, layer, obj_headline, { text : _article.headline }); 

//Create Columns
draw_set_font(fnt_newspaper);

setup_column(60, 1065, 60, _article.content[0]);
setup_column(470, 710, 460, _article.content[1]);
setup_column(885, 710, 880, _article.content[2]);

//Create Photos
var _len = array_length(photos);
photo1 = photos[irandom(_len-1)];
do {
   photo2 = photos[irandom(_len-1)]
} until (photo2 != photo1);