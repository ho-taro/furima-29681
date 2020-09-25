require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) #beforeでインスタンスをまとめて作成
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_furiganaとfirst_furigana、birthdateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上、半角英数があれば登録できる" do
        @user.password = "aaa000"
        @user.password_confirmation = "aaa000"
        expect(@user).to be_valid
      end
      it "last_nameとfirst_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.last_name = "あ漢ア"
        @user.first_name = "お字イ"
      end
      it "last_furiganaとfirst_furiganaが全角カナであれば登録できる" do
        @user.last_furigana = "アイウエオ"
        @user.first_furigana = "カキクケコ"
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password Password Include both letters and numbers", "Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaa11"
        @user.password_confirmation = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password Password Include both letters and numbers")
      end
      it "passwordが数字だけでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
      end
      it "passwordが英字だけでは登録できない" do
        @user.password = "abcdefg"
        @user.password_confirmation = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name Full-width characters")
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name Full-width characters")
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it "last_furiganaが空では登録できない" do
        @user.last_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana can't be blank", "Last furigana Full-width katakana characters")
      end
      it "last_furiganaが半角では登録できない" do
        @user.last_furigana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana Full-width katakana characters")
      end
      it "last_furiganaが全角（ひらがな）では登録できない" do
        @user.last_furigana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana Full-width katakana characters")
      end
      it "last_furiganaが全角（漢字）では登録できない" do
        @user.last_furigana = "漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana Full-width katakana characters")
      end
      it "first_furiganaが空では登録できない" do
        @user.first_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana can't be blank", "First furigana Full-width katakana characters")
      end
      it "first_furiganaが半角では登録できない" do
        @user.first_furigana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana Full-width katakana characters")
      end
      it "first_furiganaが全角（ひらがな）では登録できない" do
        @user.first_furigana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana Full-width katakana characters")
      end
      it "first_furiganaが全角（漢字）では登録できない" do
        @user.first_furigana = "漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana Full-width katakana characters")
      end
      it "birthdateが空では登録できない" do
        @user.birthdate = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end
    end
  end
end