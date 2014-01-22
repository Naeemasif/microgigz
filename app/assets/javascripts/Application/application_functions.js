/*to change the back ground of active and inactive tab in navbar */

function change_background(x)
{
    $("li>a").css("background","transparent");
   // x.style.background="black";
    $(x).css("background","black");
}
/*to change the back ground of active and inactive tab in navbar */

function change_nav_tabs_background(x)
{
  if (x == "leads")
  {
      $("li>a.listerner").css("background","transparent");
      $("#leads").css("background","black");
  }
  else if (x == "projects")
  {
      $("li>a.listerner").css("background","transparent");
      $("#projects").css("background","black");
  }
}
