require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
       it "returns http success" do
         get :edit, {id: my_wiki.id}
         expect(response).to have_http_status(:success)
       end

       it "renders the #edit view" do
         get :edit, {id: my_wiki.id}

         expect(response).to render_template :edit
       end

       it "assigns post to be updated to @post" do
         get :edit, {id: my_wiki.id}

         post_instance = assigns(:post)

         expect(post_instance.id).to eq my_wiki.id
         expect(post_instance.title).to eq my_wiki.title
         expect(post_instance.body).to eq my_wiki.body
       end
     end

    describe "POST #create" do
      it "returns http success" do
        get :create
        expect(response).to have_http_status(:success)
      end
    end

    describe "PUT update" do
         it "updates wiki with expected attributes" do
           new_title = RandomData.random_sentence
           new_body = RandomData.random_paragraph

           put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body}
     
           updated_wiki = assigns(:wiki)
           expect(updated_post.id).to eq my_post.id
           expect(updated_post.title).to eq new_title
           expect(updated_post.body).to eq new_body
         end

         it "redirects to the updated post" do
           new_title = RandomData.random_sentence
           new_body = RandomData.random_paragraph

           put :update, id: my_wiki.id, post: {title: new_title, body: new_body}
           expect(response).to redirect_to my_post
         end
       end

    describe "DELETE #destroy" do
      it "returns http success" do
        get :delete
        expect(response).to have_http_status(:success)
      end
    end

end
