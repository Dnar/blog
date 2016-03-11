require "spec_helper"

describe ArticlesController do
  it { should use_before_filter :authenticate_user! }
end