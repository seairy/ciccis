# -*- encoding : utf-8 -*-p
class StatisticsController < ApplicationController
  
  def general
    @total_conventioners_count = Conventioner.all.size
    @registered_conventioners_count = Conventioner.registered.size
    @unregistered_conventioners_count = Conventioner.unregistered.size
    @domestic_conventioners_count = Conventioner.domestic.size
    @foreign_conventioners_count = Conventioner.foreign.size
    @consulate_conventioners_count = Conventioner.consulate.size
    @voting_conventioners_count = Conventioner.voting.size
    @nonvoting_conventioners_count = Conventioner.nonvoting.size
    @attend_opening_conventioners_count = Conventioner.attend_opening.size
    @unattend_opening_conventioners_count = Conventioner.unattend_opening.size
    @unsure_attend_opening_conventioners_count = Conventioner.unsure_attend_opening.size
    @attend_show_conventioners_count = Conventioner.attend_show.size
    @unattend_show_conventioners_count = Conventioner.unattend_show.size
    @unsure_attend_show_conventioners_count = Conventioner.unsure_attend_show.size
    @attend_explanation_conventioners_count = Conventioner.attend_explanation.size
    @unattend_explanation_conventioners_count = Conventioner.unattend_explanation.size
    @unsure_attend_explanation_conventioners_count = Conventioner.unsure_attend_explanation.size
    @attend_banquet_conventioners_count = Conventioner.attend_banquet.size
    @unattend_banquet_conventioners_count = Conventioner.unattend_banquet.size
    @unsure_attend_banquet_conventioners_count = Conventioner.unsure_attend_banquet.size
    @attend_closing_conventioners_count = Conventioner.attend_closing.size
    @unattend_closing_conventioners_count = Conventioner.unattend_closing.size
    @unsure_attend_closing_conventioners_count = Conventioner.unsure_attend_closing.size
  end
  
  def occupation
    @hotels = Hotel.all
    @unoccupied_conventioners = Conventioner.unoccupied
  end
  
  def title
    @titles = Title.all
  end
end

