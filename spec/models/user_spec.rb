require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context 'ユーザー登録ができる時' do
      it "全ての値が正常に入力されれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "terminatort800"
        @user.password_confirmation = "terminatort800"
        expect(@user).to be_valid
      end
      it "passwordが英数字混合であれば登録できる" do
        @user.password = "terminatort800"
        @user.password_confirmation = "terminatort800"
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank", "Nickname is invalid. Input half-width characters."
      end
      it "nicknameが全角文字が入っていると登録できない" do
        @user.nickname = "ジョン"
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname is invalid. Input half-width characters."
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailに@が無いと登録できない" do
        @user.email = "terminatorskynet.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "password_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "surnameが空だと登録できない" do
        @user.surname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Surname can't be blank"
      end
      it "surnameに半角文字が入っていると登録できない" do
        @user.surname = "Conner"
        @user.valid?
        expect(@user.errors.full_messages).to include "Surname is invalid. Input full-width characters."
      end
      it "nameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it "nameに半角文字が入っていると登録できない" do
        @user.name = "John"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name is invalid. Input full-width characters."
      end
      it "kana_surnameが空だと登録できない" do
        @user.kana_surname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana surname can't be blank"
      end
      it "kana_surnameにカタカナ以外が入っていると登録できない" do
        @user.kana_surname = "こなあ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana surname is invalid. Input full-width Katakana characters."
      end
      it "kana_nameが空だと登録できない" do
        @user.kana_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana name can't be blank"
      end
      it "kana_nameにカタカナ以外が入っていると登録できない" do
        @user.kana_name = "じょん"
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana name is invalid. Input full-width Katakana characters."
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
