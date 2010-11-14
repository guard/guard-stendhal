require 'spec_helper'

describe Guard::Stendhal::Inspector do
  subject { Guard::Stendhal::Inspector }
  
  describe "clean" do
    
    it "should remove non-spec files" do
      subject.clean(["spec/guard/stendhal_spec.rb", "bob.rb"]).should == ["spec/guard/stendhal_spec.rb"]
    end
    
    it "should remove non-spec existing files" do
      subject.clean(["spec/guard/stendhal_spec.rb", "bob_spec.rb"]).should == ["spec/guard/stendhal_spec.rb"]
    end
    
    it "should remove non-spec existing files (2)" do
      subject.clean(["spec/guard/stendhal/formatter_spec.rb"]).should == []
    end
    
    it "should keep spec folder path" do
      subject.clean(["spec/guard/stendhal_spec.rb", "spec/models"]).should == ["spec/guard/stendhal_spec.rb", "spec/models"]
    end
    
    it "should remove duplication" do
      subject.clean(["spec", "spec"]).should == ["spec"]
    end
    
    it "should remove spec folder includes in other spec folder" do
      subject.clean(["spec/models", "spec"]).should == ["spec"]
    end
    
    it "should remove spec files includes in spec folder" do
      subject.clean(["spec/guard/stendhal_spec.rb", "spec"]).should == ["spec"]
    end
    
    it "should remove spec files includes in spec folder (2)" do
      subject.clean(["spec/guard/stendhal_spec.rb", "spec/guard/stendhal/runner_spec.rb", "spec/guard/stendhal"]).should == ["spec/guard/stendhal_spec.rb", "spec/guard/stendhal"]
    end
    
  end
  
end
