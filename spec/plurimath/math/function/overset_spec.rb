require_relative '../../../../lib/plurimath/asciimath'

RSpec.describe Plurimath::Math::Function::Overset do

  it 'returns instance of Overset' do
    overset = Plurimath::Math::Function::Overset.new('70', '=')
    expect(overset).to be_a(Plurimath::Math::Function::Overset)
  end

  it 'initializes Overset object' do
    overset = Plurimath::Math::Function::Overset.new('70', '=')
    expect(overset.parameter_one).to eql('70')
    expect(overset.parameter_two).to eql('=')
  end
end
