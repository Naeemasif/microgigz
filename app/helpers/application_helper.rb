module ApplicationHelper

  #TO DISPLAY PAGE HEADER
  def pageHeader(page_name)
    str = "<header id='leads-head'>"
    str +="<section id='page-title' class='float-left'>"
    str +="<h2>"+page_name+"</h2>"
    str +="</section>"
    str +="<section  id='search-link' class='float-right'>"
    str +="<span>"+link_to(:Search)+"</span>"
    str +="</section>"
    str +="</header>"
    str +="<div class='clear-both'>"
    str +="</div>"
    str +="<hr/>"
    str.html_safe
  end

  def index_page_body(leads)
    i = 0
    str = ""
    leads.each do |lead|
      str += "<div id='leads' lang="+i.to_s+" class='row leads' onmouseover='dsiplay_circle(this);' onmouseout='hide_circle(this);' style='padding:5px 0px 5px 0px'>"
      str += "<section class='float-left'>"
      str += "<p id='lead-client'>"
      str += "<span id='active'>Active</span>"
      str += " "+link_to("#{lead.title}",lead_path(id:lead.id))
      str += "-"
      str += ""+link_to("#{lead.client.user.name}",client_path(id:lead.client.id))
      str += "</p>"
      str += "<p id='description'>"
      str += "#{lead.description}"
      str += "#</p>"
      str += "</section>"
      str += "<section id='edit-destroy-link' class='float-right'>"
      str += "<section id='"+i.to_s+"' class='edit-destroy-image'>"
      str += "<a href='#' onclick='return false;'>"
      str += "<img src='/images/settings.png' height='25' id='"+i.to_s+"' onclick='show_menu(this);' width='25'/>"
      str += "</a>"
      str += "</section>"
      str += "<div id='menu"+i.to_s+"' class='menu-position menu' onmouseover='display_block(this);' onmouseout='hide_block(this);' style='padding: 0px;margin: 0px'>"
      str += "<div class='list-group'>"
      str += " "+link_to('Edit', edit_lead_path(lead),:class=>'list-group-item')
      str += " "+link_to('Destroy', lead, method: :delete, data: { confirm: 'Are you sure?' },:class=>"list-group-item")
      str += "</div>"
      str += "</div>"
      str += "</section>"
      str += "<div class='clear-both'></div>"
      str += "</div>"
      str += "<hr/>"
      i = i+1
    end
    str.html_safe
  end

end
