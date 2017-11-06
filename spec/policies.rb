describe WikiPolicy do
  subject { described_class }

  permissions :update?, :edit? do
    it "denies access if wiki is published" do
      expect(subject).not_to permit(User.new(admin: false), wiki.new(published: true))
    end

    it "grants access if wiki is published and user is an admin" do
      expect(subject).to permit(User.new(admin: true), wiki.new(published: true))
    end

    it "grants access if wiki is unpublished" do
      expect(subject).to permit(User.new(admin: false), wiki.new(published: false))
    end
  end
end
