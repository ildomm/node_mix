require 'rspec'
#Sidekiq::Testing.fake!

describe 'Worker updater' do
  it 'should do something' do

    expect {
      BPUpdateWorker.perform_async("http://127.0.0.1:8888/")
    }.to change(BPUpdateWorker.jobs, :size).by(0)

    expect(true)
  end
end