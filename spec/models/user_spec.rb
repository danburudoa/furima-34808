require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録' do

        context 'ユーザー情報' do
          it '全ての項目が存在すれば登録できる' do
            expect(@user).to be_valid
          end

          it "passwordが６文字以上の半角英数字混合であれば登録できる" do
            @user.password = "000aaa"
            @user.password_confirmation = "000aaa"
            expect(@user).to be_valid
          end

          it 'nicknameが空では登録できないこと' do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
         end
      
        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailに@がなければ登録できないこと' do
          @user.email = 'hogehoge.com'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        
        it 'passwordが空では登録できないこと' do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
      end

        it 'passwordが5文字以下であれば登録できない' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = "111111"
          @user.password_confirmation = "222222"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        
        it "passwordは英数字混合でないと登録できない" do
          @user.password = "000000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end

        it "passwordは半角英字のみでは登録できない" do
          @user.password = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end

        it "passwordは半角数字のみでは登録できない" do
          @user.password = "000000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end

        it "passwordは全角では登録できない" do
          @user.password = "０００あいう"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end

        it 'emailが重複していれば登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end 
        
        
        end 

        context '本人情報確認' do
          it "lastname_kanjiが全角文字であれば登録できる" do
            @user.lastname_kanji = "山田"
            expect(@user).to be_valid
          end
          it "firstname_kanjiが全角文字であれば登録できる" do
            @user.firstname_kanji = "太郎"
            expect(@user).to be_valid
          end
          it "lastname_katakanaが全角カナであれば登録できる" do
            @user.lastname_katakana = "ヤマダ"
            expect(@user).to be_valid
          end
          it "firstname_katakanaが全角カナであれば登録できる" do
            @user.firstname_katakana = "タロウ"
            expect(@user).to be_valid
          end  
          it "lastname_kanjiが空では登録できない" do
            @user.lastname_kanji = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Lastname kanji can't be blank")
          end   
          it "firstname_kanjiが空では登録できない" do
            @user.firstname_kanji = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
          end   
          it "lastname_katakanaが空では登録できない" do
            @user.lastname_katakana= ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Lastname katakana can't be blank")
          end   
          it "firstname_katakanaが空では登録できない" do
            @user.firstname_katakana = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Firstname katakana can't be blank")
          end   
          it "birthdayが空では登録できない" do
            @user.birthday = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Birthday can't be blank")
          end    
              
       end
      end
  end
end