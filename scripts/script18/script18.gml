/// @desc draw_text_outline(x,y,string,outline_colour,txt_colour,alpha)

var xPos = argument[0];
var yPos = argument[1];
var str = argument[2];
var outCol = argument[3];
var txtCol = argument[4];
var alpha = argument[5];

//The outline
draw_text_transformed_colour(xPos-2,yPos-2,str,1,1,0,outCol,outCol,outCol,outCol,alpha);
draw_text_transformed_colour(xPos-2,yPos+2,str,1,1,0,outCol,outCol,outCol,outCol,alpha);
draw_text_transformed_colour(xPos+2,yPos-2,str,1,1,0,outCol,outCol,outCol,outCol,alpha);
draw_text_transformed_colour(xPos+2,yPos+2,str,1,1,0,outCol,outCol,outCol,outCol,alpha);
//The text itself
draw_text_colour(xPos,yPos,str,txtCol,txtCol,txtCol,txtCol,1);