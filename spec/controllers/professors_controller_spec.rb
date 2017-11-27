require "rails_helper"

describe ProfessorsController, type: :controller do
  describe "#show" do
    before :each do
      @id1 = "1"
      @professor1 = "545"
      @professor2 = "575"
      @results = [@professor1,@professor2]

    end
    context "When professor exists" do
      describe "When looking to show a professor" do
        it "calls the find method to retrieve the professor" do
          expect(Professor).to receive(:find).with(@id1).and_return(@professor1)
          get :show, :id => @id1 

        end
      end
    end
  end
  
  describe "#index" do
    before :each do
      @id1 = "1"
      @professor1 = "545"
      @professor2 = "575"
      @results = [@professor1,@professor2]
    end
    context "When professors exists" do
      describe "When looking to show all professors" do
        it "calls the all method to retrieve all professors" do
          expect(Professor).to receive(:all).and_return(@results)
          get :index, :id => @id1 
        end
      end
    end
  end
  
  describe "#new" do
    before :each do
      @id1 = "1"
      @professor1 = "545"
      @professor2 = "575"
      @results = [@professor1,@professor2]
    end
    context "When a professor is desired" do
      describe "When looking to add a professor" do
        it "renders new template" do
          get :new, :id => @id1 
        end
      end
    end
  end
  
  # describe "#create" do
  #   before :each do
  #     @id1 = "1"
  #     @professor1 = "545"
  #     @professor2 = "575"
  #     @name1 = "CS575"
  #     @name1 = "Software Engineering"
  #     @crn1 = "######"
  #     @results = [@professor1,@professor2]
  #   end
  #   context "When a" do
  #     describe "When b" do
  #       it "does c" do
          
  #       expect(Professor).to receive(:create!).with(@professor1).and_return(@professor1)

  describe "#create" do
    before :each do
      @id1 = "1"
      @course1 = "545"
      @course2 = "575"
      @results = [@course1,@course2]

    end
    context "When a professor is created" do
      describe "When trying to create a professor with the same name" do
        it "flashes a warning saying that a professor with that name already exists" do
          # expect(Course).to receive(:find).with(@id1).and_return(@course1)
          # get :show, :id => @id1 
        end
      end
      describe "When trying to create a professor without filling all the fields" do
        it "flashes a warning saying that was an invalid professor" do
          # expect(Course).to receive(:find).with(@id1).and_return(@course1)
          # get :show, :id => @id1 
        end
      end
    end
  end
  
  describe "#edit" do
    before :each do
      @id1 = "1"
      @professor1 = "545"
      @professor2 = "575"
      @results = [@professor1,@professor2]
    end
    context "When professor exists" do
      describe "When looking to edit a professor" do
        it "calls the find method to retrieve the professor" do
          expect(Professor).to receive(:find).with(@id1).and_return(@professor1)
          get :edit, :id => @id1 
        end
      end
    end
  end
  
  
  
    describe "updates a professor" do
      let(:id) {'1'}
      let (:params) {{:name => "CS545"}}
      let (:professor) {double('Software Engineering',params)}
       
      it "calls the find method to retrieve a professor" do
        expect(Professor).to receive(:find).with(id).and_return(professor)
        allow(professor).to receive(:update_attributes!).with(params)
        get :update, id: id, professor: params
      end
    end
    
    
     describe 'destroys a professor' do
        let(:id) {'1'}
        let(:professor) {double('Software Engineering', :name => 'CS545')}
        
        it 'calls the find method to retreive the professor' do
            expect(Professor).to receive(:find).with(id).and_return(professor)
            allow(professor).to receive(:destroy)
            get :destroy, id: id
        end
        
        it 'sets a flash message' do
           allow(Professor).to receive(:find).with(id).and_return(professor)
           allow(professor).to receive(:destroy)
           get :destroy,  id: id
           expect(flash[:notice]).to eq("Professor '#{professor.name}' deleted.")
        end
        
        it 'redirects to the professors page' do
           allow(Professor).to receive(:find).with(id).and_return(professor)
           allow(professor).to receive(:destroy)
           get :destroy,  id: id
           expect(response).to redirect_to(professors_path)
       end
    end
  # describe "#update" do
  #   before :each do
  #     @id1 = "1"
  #     @professor1 = double("545")
  #     @professor2 = double("575")
  #     @results = [@professor1,@professor2]
  #   end
  #   context "When a" do
  #     describe "When b" do
  #       it "does c" do
  #         expect(Professor).to receive(:find).with(@id1).and_return(@professor1)
  #         #get :update, :id => @id1 
  #       end
  #     end
  #   end
  # end
  
  # describe "#destroy" do
  #   before :each do
  #     @id1 = "1"
  #     @name1 = "Software Engineering"
  #     @name1 = "CS545"
  #     @professor1 = double("545", :id => @id1, :name => @name1) #, :id => @id1, :name => @name1
  #     @professor2 = "575"
  #     @results = [@professor1,@professor2]
  #   end
  #   context "When professor exists" do
  #     describe "When looking to delete a professor" do
  #       it "calls the find method to retrieve the professor" do
  #         expect(Professor).to receive(:find).with(@id1).and_return(@professor1)
  #         allow{delete :destroy, :id => @id1, :name => {:name => @professor1.name}}.to change(Professor, :count).by(-1)

  #         #get :destroy, :id => @id1 
  #       end
  #       it "calls the destroy method to destroy the professor" do
  #         allow(Professor).to receive(:find).with(@id1).and_return(@professor1)
  #         #expect(Professor.new(:name => @name1).destroy)
          
  #         expect{delete :destroy, :id => @id1, :name => {:name => @professor1.name}}.to change(Professor, :count).by(-1)
  #         #get :destroy, :id => @id1 
  #       end
  #     end
  #   end
  # end
end