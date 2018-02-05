RSpec.describe Sidekiq::Later do
  it "has a version number" do
    expect(Sidekiq::Later::VERSION).not_to be nil
  end

  context "#later method" do
    let(:target) { FakeThing.new }

    it "can be run inline" do
      expect(target.later(inline: true).one_plus_one).to eq 2
    end

    it "creates a sidekiq job" do
      expect { target.later.one_plus_one }.to change { Sidekiq::Later::Worker.jobs.count }.by 1
      expect(Sidekiq::Later::Worker.jobs.last['args']).to eq ["FakeThing", target.id, "one_plus_one"]
    end

    it "raises NoMethodError if the target does not respond to the method enqueded to be called" do
      expect { target.later.not_defined }.to raise_error(NoMethodError)
    end
  end
end
