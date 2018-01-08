module CollaboratorsHelper

  def find_collaborator(user, wiki)
    Collaborator.where(user_id: user.id, wiki_id: wiki.id).first
  end
  
end
