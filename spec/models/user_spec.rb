require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    #context '新規登録できるとき'
      it "全ての項目の入力が存在すれば登録できる" do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end

      it 'パスワードとencrypted_passwordが6文字以上であれば登録できる' do
        user = FactoryBot.build(:user, password: "aaa456", encrypted_password: "aaa456")
        user.valid?
        expect(user).to be_valid
      end

      it 'パスワードは半角英数字混合で入力すれば登録できる' do
        user = FactoryBot.build(:user, password: "aaa111", encrypted_password: "aaa111")
        user.valid?
        expect(user).to be_valid
      end
    #end

    #context '新規登録できない'
      it 'nicknameが空では登録できない' do
        user = FactoryBot.build(:user)
        user.nickname = ''
        user.valid?
        expect(user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'first_nameが空では登録できない' do
        user = FactoryBot.build(:user)
        user.first_name = ''
        user.valid?
        expect(user.errors.full_messages).to include "First name can't be blank"
      end

      it 'lastnameが空では登録できない' do
        user = FactoryBot.build(:user)
        user.last_name = ''
        user.valid?
        expect(user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'first_name_kanaが空では登録できない' do
        user = FactoryBot.build(:user)
        user.first_name_kana = ''
        user.valid?
        expect(user.errors.full_messages).to include "First name kana can't be blank"
      end

      it 'last_name_kanaが空では登録できない' do
        user = FactoryBot.build(:user)
        user.last_name_kana = ''
        user.valid?
        expect(user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it 'emailが空では登録できない' do
        user = FactoryBot.build(:user)
        user.email = ''
        user.valid?
        expect(user.errors.full_messages).to include "Email can't be blank"
      end

      it 'birthdayが空では登録できない' do
        user = FactoryBot.build(:user)
        user.birthday = ''
        user.valid?
        expect(user.errors.full_messages).to include "Birthday can't be blank"
      end

      it 'passwordが空では登録できない' do
        user = FactoryBot.build(:user)
        user.password = ''
        user.valid?
        expect(user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        user = FactoryBot.build(:user)
        user.password_confirmation = ''
        user.valid?
        expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it '重複したメールアドレスが存在すると登録できない' do
        user = FactoryBot.create(:user)
        another_user = FactoryBot.build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'メールアドレスに、@を含めなければ登録できない' do
        user = FactoryBot.build(:user, email: "aaabbb")
        user.valid?
        expect(user.errors.full_messages).to include 'Email is invalid'
      end

      it 'パスワードは、5文字以下では登録できない' do
        user = FactoryBot.build(:user, password: "12345", encrypted_password: "12345") 
        user.valid?
        expect(user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'パスワードは半角英数字混合でなければ登録できない' do
        user = FactoryBot.build(:user, password: "aaaaaa", encrypted_password: "aaaaaa")
        user.valid?
        expect(user.errors.full_messages).to include 'Password is invalid'
      end

      it 'frist_nameが全角ひらがな、全角カタカナ、漢字出ないと登録できない' do
        user = FactoryBot.build(:user, first_name: "aaa")
        user.valid?
        expect(user.errors.full_messages).to include 'First name is invalid'
      end

      it 'last_nameが全角ひらがな、全角カタカナ、漢字出ないと登録できない' do
        user = FactoryBot.build(:user, last_name: "aaa")
        user.valid?
        expect(user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'first_name_kanaが全角カタカナでないと登録できない' do
        user= FactoryBot.build(:user, first_name_kana: "aaa")
        user.valid?
        expect(user.errors.full_messages).to include 'First name kana is invalid'
      end

      it 'last_name_kanaが全角カタカナでないと登録できない' do
        user = FactoryBot.build(:user,last_name_kana: "aaa")
        user.valid?
        expect(user.errors.full_messages).to include 'Last name kana is invalid'
      end
    #end
  end
end
