module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  def is_active?(page_name)
    if params[:controller] == page_name
        return "active"
    end
  end

  def render_related_links
     render "#{params[:controller]}/related_links"

   end


  #TO DISPLAY PAGE HEADER
  def pageHeader(page_name)
    str = "<header id='page-header'>"
    str +="<section id='page-title' class='float-left'>"
    str +="<h2>"+page_name+"</h2>"
    str +="</section>"
    str +="<section  id='search-link' class='float-right'>"
    str +="<div>"+link_to(:Search)+"<button type='button' onclick='display_aside();' class='btn btn-default btn-sm margin-left hidden-lg'><span class='glyphicon glyphicon-align-justify'></span></button></div>"
    str +="</section>"
    str +="</header>"
    str +="<div class='clear-both'>"
    str +="</div>"
    str +="<hr class='margin-top-25px'/>"
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

  def aside(related_links)
    str  ="<div class='list-group'>"
    @related_links = related_links
    for i in 0..@related_links.length - 1
      str  +="<a href='"+@related_links[i]["url"]+"' style='border-radius:0px' class='list-group-item' >"+@related_links[i]["text"]+"</a>"
    end
    str  +="</div>"
    str.html_safe
  end

end
