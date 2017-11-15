require "rails_helper"

describe CoursesController, type: :controller do
  describe "#show" do
    before :each do
      @id1 = "1"
      @course1 = "545"
      @course2 = "575"
      @results = [@course1,@course2]

    end
    context "When course exists" do
      describe "When looking to show a course" do
        it "calls the find method to retrieve the course" do
          expect(Course).to receive(:find).with(@id1).and_return(@course1)
          get :show, :id => @id1 

        end
      end
    end
  end
  
  describe "#index" do
    before :each do
      @id1 = "1"
      @course1 = "545"
      @course2 = "575"
      @results = [@course1,@course2]
    end
    context "When courses exists" do
      describe "When looking to show all courses" do
        it "calls the all method to retrieve all courses" do
          expect(Course).to receive(:all).and_return(@results)
          get :index, :id => @id1 
        end
      end
    end
  end
  
  describe "#new" do
    before :each do
      @id1 = "1"
      @course1 = "545"
      @course2 = "575"
      @results = [@course1,@course2]
    end
    context "When a course is desired" do
      describe "When looking to add a course" do
        it "renders new template" do
          get :new, :id => @id1 
        end
      end
    end
  end
  
  # describe "#create" do
  #   before :each do
  #     @id1 = "1"
  #     @course1 = "545"
  #     @course2 = "575"
  #     @abbrev1 = "CS575"
  #     @name1 = "Software Engineering"
  #     @crn1 = "######"
  #     @results = [@course1,@course2]
  #   end
  #   context "When a" do
  #     describe "When b" do
  #       it "does c" do
          
  #       expect(Course).to receive(:create!).with(@course1).and_return(@course1)

          
          
  #         #get :create, :id => @id1 
  #       end
  #     end
  #   end
  # end
  
  describe "#edit" do
    before :each do
      @id1 = "1"
      @course1 = "545"
      @course2 = "575"
      @results = [@course1,@course2]
    end
    context "When course exists" do
      describe "When looking to edit a course" do
        it "calls the find method to retrieve the course" do
          expect(Course).to receive(:find).with(@id1).and_return(@course1)
          get :edit, :id => @id1 
        end
      end
    end
  end
  
  
  
    describe "updates a course" do
      let(:id) {'1'}
      let (:params) {{:abbrev => "CS545"}}
      let (:course) {double('Software Engineering',params)}
       
      it "calls the find method to retrieve a course" do
        expect(Course).to receive(:find).with(id).and_return(course)
        allow(course).to receive(:update_attributes!).with(params)
        get :update, id: id, course: params
      end
    end
    
    
     describe 'destroys a course' do
        let(:id) {'1'}
        let(:course) {double('Software Engineering', :abbrev => 'CS545')}
        
        it 'calls the find method to retreive the course' do
            expect(Course).to receive(:find).with(id).and_return(course)
            allow(course).to receive(:destroy)
            get :destroy, id: id
        end
        
        it 'sets a flash message' do
           allow(Course).to receive(:find).with(id).and_return(course)
           allow(course).to receive(:destroy)
           get :destroy,  id: id
           expect(flash[:notice]).to eq("Course '#{course.abbrev}' deleted.")
        end
        
        it 'redirects to the courses page' do
           allow(Course).to receive(:find).with(id).and_return(course)
           allow(course).to receive(:destroy)
           get :destroy,  id: id
           expect(response).to redirect_to(courses_path)
       end
    end
  # describe "#update" do
  #   before :each do
  #     @id1 = "1"
  #     @course1 = double("545")
  #     @course2 = double("575")
  #     @results = [@course1,@course2]
  #   end
  #   context "When a" do
  #     describe "When b" do
  #       it "does c" do
  #         expect(Course).to receive(:find).with(@id1).and_return(@course1)
  #         #get :update, :id => @id1 
  #       end
  #     end
  #   end
  # end
  
  # describe "#destroy" do
  #   before :each do
  #     @id1 = "1"
  #     @name1 = "Software Engineering"
  #     @abbrev1 = "CS545"
  #     @course1 = double("545", :id => @id1, :name => @name1) #, :id => @id1, :abbrev => @abbrev1
  #     @course2 = "575"
  #     @results = [@course1,@course2]
  #   end
  #   context "When course exists" do
  #     describe "When looking to delete a course" do
  #       it "calls the find method to retrieve the course" do
  #         expect(Course).to receive(:find).with(@id1).and_return(@course1)
  #         allow{delete :destroy, :id => @id1, :name => {:name => @course1.name}}.to change(Course, :count).by(-1)

  #         #get :destroy, :id => @id1 
  #       end
  #       it "calls the destroy method to destroy the course" do
  #         allow(Course).to receive(:find).with(@id1).and_return(@course1)
  #         #expect(Course.new(:abbrev => @abbrev1).destroy)
          
  #         expect{delete :destroy, :id => @id1, :name => {:name => @course1.name}}.to change(Course, :count).by(-1)
  #         #get :destroy, :id => @id1 
  #       end
  #     end
  #   end
  # end
end