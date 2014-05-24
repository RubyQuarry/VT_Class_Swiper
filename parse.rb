

module NavigateHokieSpa



  def hokie_spa_welcome_page(args = {})
    agent = args[:agent]
    page = agent.get('http://hokiespa.vt.edu')
    page = agent.page.link_with(:text => 'Login to HokieSpa >>>').click
    page.forms()[0]
  end


  def login(args = {})
    puts "What is your username?"
    args[:form].username=gets.chomp
    puts "What is your password?"
    args[:form].password = gets.chomp
    args[:agent].submit(args[:form], args[:form].buttons.first)
  end





  #Find registration and schedule page.
  def traverse_to_schedule(args = {})
    page = args[:page]
    agent = args[:agent]
    text_link =  page.links.map{|link| link.text.include?"Not Now"}
    page = agent.page.link_with(:text =>  "\n      Not Now\n    ").click if text_link.include? true
    page = agent.page.link_with(:text =>  "Hokie Spa").click if text_link.include? true
    page = agent.page.link_with(:text => "Registration and Schedule").click
    page
  end


  #parse all valid terms
  def terms_available(args = {})
    agent = args[:agent]
    page = args[:page]
    terms = agent.page.search('tr > td.delabel > p > b').reject{|term| term.to_s !~ /\d{4}/}
    terms
  end




  #get all drop add links
  def drop_add_links(args = {})
    page = args[:page]
    drop_add = page.links.select{|link| link.text == "Drop/Add" }
    drop_add.uniq!{|link| link.href }
    pp drop_add
  end


end