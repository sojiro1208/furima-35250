require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全部埋めれば登録できる' do
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
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid", "Password is too short (minimum is 6 characters)", "Password confirmation doesn't match Password")
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

    it 'パスワードは、5文字以下では登録できない' do
      @user.password = 'a0'
      @user.password_confirmation = 'a0'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'パスワードは、半角英字のみの入力では登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'パスワードは、半角数字飲みの入力では登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'パスワードとパスワード（確認用）、値の一致していなければ登録できない' do
      @user.password = 'a1a1a1'
      @user.password_confirmation = 'b2b2b2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.last_name = 'nobi'
      @user.first_name = 'nobita'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
    end

    it 'ユーザー本名のフリガナは、全角（カタカナ）でなければ登録できない' do
      @user.last_name_kana = '野比'
      @user.first_name_kana = 'のび太'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
    end

    it '重複したemailが存在すると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailは、@を含めないと登録できない' do
      @user.email = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it '全角では登録できないこと' do
      @user.password = "A1A1A1"
      @user.password_confirmation = 'A1A1A1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

  end
end
