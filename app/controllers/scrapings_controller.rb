class ScrapingsController < ApplicationController
  def index
    agent = Mechanize.new
    @bodys =[]
    @titiles_array =[]
    @companies_name_array =[]
    @bills_array =[]
    @PRs_array =[]
    @start_num = params[:start]||1
    @end_num = params[:end]||2
    
    @start_num.upto(@end_num) do |list_num|
      
      page = agent.get("https://jinjibu.jp/service/list/#{list_num}/?lc=1&mc=&sc=&pca=&ts=&dl=&k=")

      page.search('h3 a').each do |elem|
        @titiles_array.push(elem.inner_text)
      end
      
      #有料掲載版
      page.search('.servicelistspec tr[1] td').each do |elem2|
        @companies_name_array.push(elem2.inner_text)
      end
      
      #無償掲載版
      page.search('.servicelistspec3 tr[1] td').each do |elem2|
        @companies_name_array.push(elem2.inner_text)
      end

      
      page.search('.servicelistspec tr[4] td').each do |elem2|
        @bills_array.push(elem2.inner_text)
      end
      page.search('.servicelistspec3 tr[4] td').each do |elem2|
        @bills_array.push(elem2.inner_text)
      end

      page.search('.servicelistspec tr[5] td').each do |elem2|
        @PRs_array.push(elem2.inner_text)
      end
      page.search('.servicelistspec3 tr[5] td').each do |elem2|
        @PRs_array.push(elem2.inner_text)
      end


      @titiles_array.size.times do |elem|
        @body = []
        @body.push(@titiles_array[elem])
        @body.push(@companies_name_array[elem])
        @body.push(@bills_array[elem])
        @body.push(@PRs_array[elem])
        @bodys.push(@body)
      end
    end
  end

end
