require 'rails_helper'

RSpec.describe User, type: :model do
  include FactoryBot::Syntax::Methods # ファクトリーボットのメソッド

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '登録ができるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123456a' # 半角英数字混合
        @user.password_confirmation = '123456a'
        expect(@user).to be_valid
      end
    end

    context '登録ができないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        user = create(:user)
        duplicate_user = build(:user, email: user.email)
        duplicate_user.valid?
        expect(duplicate_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要があること' do
        invalid_user = build(:user, email: 'invalid_email')
        invalid_user.valid?
        expect(invalid_user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードは、半角英数字混合での入力が必須であること' do
        invalid_user = build(:user, password: '123456')
        invalid_user.valid?
        expect(invalid_user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')

        invalid_user.password = 'abcdef'
        invalid_user.valid?
        expect(invalid_user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        user = build(:user, password_confirmation: 'wrong_password')
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
