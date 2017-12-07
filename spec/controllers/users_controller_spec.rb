require "rails_helper"

describe UsersController, type: :controller do
  describe "#index" do
    before :each do
      @id1 = "1"
      @user1 = "Jarrod"
      @user2 = "Stephen"
      @results = [@user1,@user2]

    end
    context "When user exists" do
      describe "When looking for index of users" do
        it "calls the all method to retrieve the professor" do
          expect(User).to receive(:all).and_return(@user1)
          get :index, :id => @id1
        end
      end
    end
  end
   describe "#create" do
     before :each do
       @id1 = "1"
       @username1 = "Jarrod"
       @user1 = double('user1', :username => @username1)
       @user2 = "Stephen"
       @results = [@user1,@user2]
       @user3 = double('Mr. Guy', :username => 'momma mia')
       @valid
       @good_user = double('user4', :username => "Stephen", :password =>"CoolBeans", :emailID => "smmo1@gmail.com")
       @bad_user = double('user5', :username => "", :password =>"s", :emailID => "smmo1gmail.com")

      
     end
     context "When user already exists" do
       describe "invalid user input" do
         let(:id) {'1'}
         let(:params){{:username=>"Jarrod", :password =>"CoolBeans", :emailID => "heyguysitsme@gmail.com"}}
         let(:user) {double('user', params)}
         it "creates a user" do
             expect(User).to receive(:create).with(params).and_return(@bad_user)
             allow(@bad_user).to receive(:valid?)
             allow(flash[:warning] = "Invalid Registration.")
             #expect(response).to redirect_to(guide_index_path)
             post :create, user: params

         end
         it "user is not valid" do
             allow(User).to receive(:create).with(params).and_return(@bad_user)
             expect(@bad_user).to receive(:valid?)
             allow(flash[:warning] = "Invalid Registration.")
        #     allow(response).to redirect_to(guide_index_path)
             post :create, user: params

         end
        it "flash message failure" do
           allow(User).to receive(:create).with(params).and_return(@bad_user)
           allow(@bad_user).to receive(:valid?)
           expect(flash[:warning] = "Invalid Registration.")
        #     allow(response).to redirect_to(guide_index_path)
           post :create, user: params
        end
        # it "redirect to index" do
        #     allow(User).to receive(:create).with(params).and_return(@bad_user)
        #     allow(@bad_user).to receive(:valid?)
        #     allow(flash[:warning] = "Invalid Registration.")
        #     expect(response).to redirect_to(guide_index_path)
        #     post :create, user: params
        # end
      end
    end
    context "When user doesn't yet exist" do
     describe "valid user input" do
         let(:id) {'1'}
         let(:params){{:username=>"Jarrod"}}
         let(:user) {double('user', params)}
         it "calls the all method to retrieve the professor" do
           expect(User).to receive(:create).with(params).and_return(@good_user)
           allow(@good_user).to receive(:valid?)
           allow(flash[:notice] = "User Successfully Registered")
    #       allow(response).to redirect_to(guide_index_path)
           post :create, user: params
         end
         it "user is valid" do
          allow(User).to receive(:create).with(params).and_return(@good_user)
          expect(@good_user).to receive(:valid?)
          allow(flash[:notice] = "User Successfully Registered")
    #      allow(response).to redirect_to(guide_index_path)
          post :create, user: params
         end
         it "flash message success" do
           allow(User).to receive(:create).with(params).and_return(@good_user)
           allow(@good_user).to receive(:valid?)
           expect(flash[:notice] = "User Successfully Registered")
    #       allow(response).to redirect_to(guide_index_path)
           post :create, user: params
         end
    #     it "redirect to index" do
    #       allow(User).to receive(:create).with(params).and_return(@good_user)
    #       allow(@good_user).to receive(:valid?)
    #       allow(flash[:notice] = "User Successfully Registered")
    #       expect(response).to redirect_to(guide_index_path)
    #       post :create, user: params
    #     end
       end
     end
  end
end

#   def create
#     @user = User.create(params.require(:user).permit(:username, :password, :emailID))
#     if !@user.valid?
#       flash[:warning] = "Invalid Registration."
#     else
#       flash[:notice] = "User Successfully Registered"
#     end
#     redirect_to guide_index_path
#   end
# end