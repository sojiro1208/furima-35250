require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    it '全部埋めれば登録できる' do
      expect(@user).to be_valid
    end

    it 'パスワードが６文字以上なら登録できる' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'aaa111'
      expect(@user).to be_valid
    end

    it 'ニックネームが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスがからでは登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'パスワードがからでは登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password Include both letters and numbers", "Password confirmation doesn't match Password")
    end

    it 'お名前（苗字）がからでは登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end

    it 'お名前（名前）がからでは登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end

    it 'お名前カナ（苗字）がからでは登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
    end

    it 'お名前カナ（名前）がからでは登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
    end

    it 'お名前カナがからでは登録できない' do
      @user.last_name_kana = ''
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid", "Last name kana can't be blank", "Last name kana is invalid")
    end

    it '生年月日がからでは登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'お名前がからでは登録できない' do
      @user.last_name = ''
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid", "Last name can't be blank", "Last name is invalid")
    end

  end
end
