require "spec_helper"

describe Spree::Order do
  before :each do
    allow(subject).to receive(:new_order_for_email?).and_return false
    allow(subject).to receive(:subscription?).and_return nil
    allow(subject).to receive(:wholesale?).and_return false
  end

  it "has no custom tags by default" do
    expect(subject.custom_tags).to eq []
  end

  it "has the tag 'first-order' if new_order_for_email?" do
    allow(subject).to receive(:new_order_for_email?).and_return true
    expect(subject.custom_tags).to eq [:first_order]
  end

  it "has the tag 'subscription' if subscription? is true?" do
    allow(subject).to receive(:subscription?).and_return true
    expect(subject.custom_tags).to eq [:subscription]
  end

  it "has the tag 'wholesale' if wholesale? is true?" do
    allow(subject).to receive(:wholesale?).and_return true
    expect(subject.custom_tags).to eq [:wholesale]
  end
end
