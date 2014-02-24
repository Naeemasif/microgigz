/*ASIDE PANEL DISPLAY HIDE*/
function display_aside()
{
    $("#aside").css("display","inline-block");
}
function hide_aside()
{
    $("#aside").css("display","none");
}
/*ASIDE PANEL DISPLAY HIDE*/


/*TO HIDE THE CREATE CREATE CLIENT AND NEW OPTION FOR NEW CLIENT IN LEADS INDEX.HTML.ERB*/
function hide_panel()
{
    $("#create_client").hide();
    $("#new_client").hide();
}
/*TO HIDE THE CREATE CREATE CLIENT AND NEW OPTION FOR NEW CLIENT IN LEADS INDEX.HTML.ERB*/


/*TO DISPLAY CREATE CLIENT FORM ON NEW LEADS PAGE*/
function create_client(x)
{
    $.ajax({
        url:'/leads/client_creation_form',
        type:'post',
        data:'search='+x
    });
}
/*TO DISPLAY CREATE CLIENT FORM ON NEW LEADS PAGE*/

/*TO FIND THE SIMILAR CLIENTS ON LEADS NEW ON KEY UP EVENT*/
function find_client(x)
{
    $.ajax({
        url:'/clients/client',
        type:'post',
        data:'search='+ x.value
    });
}
/*TO FIND THE SIMILAR CLIENTS ON LEADS NEW ON KEY UP EVENT*/

/*TO GET SELECTED CLIENT NAME AND ID FROM DATA LIST*/
function get_client_name(x)
{
    var list = document.getElementById("items");
    for (var j = 0; j < list.options.length; j++)
    {
        if (x.value == list.options[j].value)
        {
            document.getElementById("client_id").value = list.options[j].label;
        }
    }
}
/*TO GET SELECTED CLIENT NAME AND ID FROM DATA LIST*/