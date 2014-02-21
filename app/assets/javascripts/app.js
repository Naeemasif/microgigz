/*TO DSIPLAY CIRLE ON MOUSE OVER ON EACH RECORD*/
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
/*TO DSIPLAY CIRLE ON MOUSE OVER ON EACH RECORD*/


/*TO SHOW AND HIDE EDIT-DESTROY MENU BUTTON*/
function display_block(x)
{
    x.style.display='block';
}

function hide_block(x)
{
    x.style.display='none';
}
/*TO SHOW AND HIDE EDIT-DESTROY MENU BUTTON*/


/*TOGGLE EDIT-DESTROY MENU*/
function show_menu(x)
{
    $("#menu"+ x.id).toggle(500);
}
/*TOGGLE EDIT-DESTROY MENU*/



















   /*raw*/

function remove(x)
{
    x.css("display","none");
}

