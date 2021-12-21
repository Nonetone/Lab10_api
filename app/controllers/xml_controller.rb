class XmlController < ApplicationController
        layout false
        before_action :parse_params, only: :find
    
    def find
        happy = []
        0.upto(@number) do |i|
          digits = i.digits.reverse
          if digits.length < 6
            (6 - digits.length).times do
              digits.prepend(0)
            end
          end
          happy.push(i) if digits.slice(0, 3).sum == digits.slice(3, 3).sum
        end
        happy.map { |elem| { elem: elem, elemus: elem.to_s} }
        respond_to do |format|
            format.xml { render xml: happy.to_xml }
            format.rss { render xml: happy.to_xml }
        end  
      end 
      
      ########
    protected
        def parse_params
            @number = params[:number].to_i
        end

end
    
