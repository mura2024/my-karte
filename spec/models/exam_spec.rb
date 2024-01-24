require 'rails_helper'

RSpec.describe Medical, type: :model do
  before do
    @exam = FactoryBot.build(:exam)
  end

  describe '記録作成' do
    context '新規作成できる場合' do
      it '全ての項目が存在すれば作成できる' do
        expect(@exam).to be_valid
      end
      it '画像が空でも作成できる' do
        @exam.image = nil
        expect(@exam).to be_valid
      end
    end

    context '新規作成できない場合' do
      it '病院名が空では作成できない' do
        @exam.hospital = ''
        @exam.valid?
        expect(@exam.errors.full_messages).to include('病院名を入力してください')
      end
      it '診察日が空では作成できない' do
        @exam.exam_date = ''
        @exam.valid?
        expect(@exam.errors.full_messages).to include('診察日を入力してください')
      end
      it 'タイトルが空では作成できない' do
        @exam.title = ''
        @exam.valid?
        expect(@exam.errors.full_messages).to include('タイトルを入力してください')
      end
      it 'コメントが空では作成できない' do
        @exam.comment = ''
        @exam.valid?
        expect(@exam.errors.full_messages).to include('コメントを入力してください')
      end
      it 'medicalが紐付いていないと作成できない' do
        @exam.medical = nil
        @exam.valid?
        expect(@exam.errors.full_messages).to include('Medicalを入力してください')
      end
      it 'userが紐付いていないと作成できない' do
        @exam.user = nil
        @exam.valid?
        expect(@exam.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end