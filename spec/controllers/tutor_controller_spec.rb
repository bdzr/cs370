require 'rails_helper'
require 'capybara/rspec'
require 'spec_helper'

describe TutorsController do
  fixtures :evals
  describe 'tutor metrics' do
    let!(:tutor) {Tutor.create()}
    let!(:eval1) { Eval.create()}
    zone = ActiveSupport::TimeZone.new('Hawaii')
    it 'expects to have 22 total hours' do
      @tutor1 = FactoryBot.create(:tutor, :id => 1)
      eval2 = evals(:eval1)
      expect(@tutor1.id).to equal(eval2.tutor_id)
      expect(Tutor.find(@tutor1.id)).to eq(@tutor1)
      expect(Tutor.total_hours_helper(@tutor1)).to eq(22)
    end

    it 'expects to have 22 hours done this week' do
      allow(Time).to receive(:now).and_return(Time.mktime(2019,04,28,11,00,00).gmtime)
      @tutor1 = FactoryBot.create(:tutor, :id => 1)
      eval2 = evals(:eval1)
      expect(@tutor1.id).to equal(eval2.tutor_id)
      expect(Tutor.find(@tutor1.id)).to eq(@tutor1)
      expect(Tutor.hours_this_week_helper(@tutor1)).to eq(22)
    end

    it 'expects to have 22 on average' do
      allow(Time).to receive(:now).and_return(Time.mktime(2019,04,28,11,00,00).gmtime)
      @tutor1 = FactoryBot.create(:tutor, :id => 1)
      eval2 = evals(:eval1)
      expect(@tutor1.id).to equal(eval2.tutor_id)
      expect(Tutor.find(@tutor1.id)).to eq(@tutor1)
      expect(Tutor.average_hours_helper(@tutor1)).to eq(22)
    end

  end
end