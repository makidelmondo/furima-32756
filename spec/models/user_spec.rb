require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank", "Nickname is invalid. Input half-width characters."
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank", "Password confirmation doesn't match Password"
    end
    it "password_confirmationが空だと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "surnameが空だと登録できない" do
      @user.surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Surname can't be blank", "Surname is invalid. Input full-width characters."
    end
    it "nameが空だと登録できない" do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Name can't be blank", "Name is invalid. Input full-width characters."
    end
    it "kana_surnameが空だと登録できない" do
      @user.kana_surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana surname can't be blank", "Kana surname is invalid. Input full-width characters."
    end
    it "kana_nameが空だと登録できない" do
      @user.kana_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana name can't be blank", "Kana name is invalid. Input full-width characters."
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
