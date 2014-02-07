$(document).ready(function (){

});

function  show_menu(x)
{
    $("#menu"+ x.id).toggle(500);
}
function dsiplay_circle(x)
{

    x.style.background = '#FAFAFA' ;
    $("#"+ x.lang).css("display","inline-block");

}
function hide_circle(x)
{
    x.style.background = 'white';
    $("#"+ x.lang).css("display","none");
}

function remove(x)
{
    x.css("display","none");
}

function display_block(x)
{
    x.style.display='block';
}

function hide_block(x)
{
    x.style.display='none';
}