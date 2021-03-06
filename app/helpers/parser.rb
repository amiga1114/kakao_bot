module Parser
  class Movie
    def naver
      image = true
      url = "http://movie.naver.com/movie/running/current.nhn?view=list&tab=normal&order=reserve"
      movie_html = RestClient.get(url)
      doc = Nokogiri::HTML(movie_html)

      movie_title = Array.new
      movie_info = Hash.new
      doc.css("ul.lst_detail_t1 dt a").each do |title|
        movie_title << title.text
      end
      doc.css("ul.lst_detail_t1 li").each do |movie|
        movie_info[movie.css("dl dt.tit a").text] = {
          :url => movie.css("div.thumb img").attribute('src').to_s,
          :star => movie.css("dl.info_star span.num").text
        }
      end
      sample_movie = movie_title.sample
      return_text = sample_movie + " " + movie_info[sample_movie][:star]
      img_url = movie_info[sample_movie][:url]

      return [return_text, img_url]
    end
  end

  class Animal
    def cat
      # 고양이 사진 보여주기
      return_text = "야옹~"
      image = true
      url = "http://thecatapi.com/api/images/get?format=xml&type=jpg"
      cat_xml = RestClient.get(url)
      doc = Nokogiri::XML(cat_xml)
      cat_url = doc.xpath("//url").text

      return [return_text, cat_url]
    end
  end
end
