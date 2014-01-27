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
      $("#leads").css("background","white");
      $("#leads").css("border","1px solid #A1A1A1");
      $("#leads").css("border-bottom","1px solid transparent");
  }
  else if (x == "projects")
  {
      $("li>a.listerner").css("background","transparent");
      $("#projects").css("background","white");
      $("#projects").css("border","1px solid #A1A1A1");
      $("#projects").css("border-bottom","1px solid transparent");
  }
  else if(x == "clients")
  {
      $("li>a.listerner").css("background","transparent");
      $("#clients").css("background","white");
      $("#clients").css("border","1px solid #A1A1A1");
      $("#clients").css("border-bottom","1px solid transparent");
  }
}
