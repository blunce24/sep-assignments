include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("Pacific Rim", 72) }

  let (:tree) { MinBinaryHeap.new(root) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:matrix) { Node.new("The Matrix", 87) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
     it "properly inserts a new node as a left child" do
       tree.insert(root, braveheart)
       expect(root.left.title).to eq "Braveheart"
     end

     it "properly inserts a new node as a right child" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       expect(root.right.title).to eq "Star Wars: Return of the Jedi"
     end

     it "properly inserts a new node as a left-left child" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       tree.insert(root, donnie)
       expect(root.left.left.title).to eq "Donnie Darko"
     end

     it "properly inserts a new node as a left-right child" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       tree.insert(root, donnie)
       tree.insert(root, matrix)
       expect(root.left.right.title).to eq "The Matrix"
     end

    it "properly inserts a new node as a right-left child" do
      tree.insert(root, braveheart)
      expect(root.left).to eq(braveheart)

      tree.insert(root, jedi)
      expect(root.right).to eq(jedi)

      tree.insert(root, donnie)
      expect(root.left.left).to eq(donnie)

      tree.insert(root, matrix)
      expect(root.left.right).to eq(matrix)

      tree.insert(root, inception)
      expect(root.right.left).to eq(inception)
    end

     it "properly inserts a new node as a right-right child" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       tree.insert(root, donnie)
       tree.insert(root, matrix)
       tree.insert(root, inception)
       tree.insert(root, district)
       expect(root.right.right.title).to eq "District 9"
     end
  end

   describe "#find(data)" do
     it "handles nil gracefully" do
       tree.insert(root, empire)
       tree.insert(root, mad_max_2)
       expect(tree.find(root, nil)).to eq nil
     end

     it "properly finds a left node" do
       tree.insert(root, braveheart)
       expect(tree.find(root, braveheart.title).title).to eq "Braveheart"
     end

     it "properly finds a right node" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       expect(tree.find(root, jedi.title).title).to eq "Star Wars: Return of the Jedi"
     end

     it "properly finds a left-left node" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       tree.insert(root, donnie)
       expect(tree.find(root, donnie.title).title).to eq "Donnie Darko"
     end

     it "properly finds a left-right node" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       tree.insert(root, donnie)
       tree.insert(root, matrix)
       expect(tree.find(root, matrix.title).title).to eq "The Matrix"
     end

     it "properly finds a right-left node" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       tree.insert(root, donnie)
       tree.insert(root, matrix)
       tree.insert(root, inception)
       expect(tree.find(root, inception.title).title).to eq "Inception"
     end

     it "properly finds a right-right node" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       tree.insert(root, donnie)
       tree.insert(root, matrix)
       tree.insert(root, inception)
       tree.insert(root, district)
       expect(tree.find(root, district.title).title).to eq "District 9"
     end
   end

   describe "#delete(data)" do
     it "handles nil gracefully" do
       expect(tree.delete(root, nil)).to eq nil
     end

     it "properly deletes a left node" do
       tree.insert(root, braveheart)
       tree.delete(root, braveheart.title)
       expect(tree.find(root, braveheart.title)).to be_nil
     end

     it "properly deletes a right node" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       tree.delete(root, jedi.title)
       expect(tree.find(root, jedi.title)).to be_nil
     end

     it "properly deletes a left-left node" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       tree.insert(root, donnie)
       tree.delete(root, donnie.title)
       expect(tree.find(root, donnie.title)).to be_nil
     end

     it "properly deletes a left-right node" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       tree.insert(root, donnie)
       tree.insert(root, matrix)
       tree.delete(root, matrix.title)
       expect(tree.find(root, matrix.title)).to be_nil
     end

     it "properly deletes a right-left node" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       tree.insert(root, donnie)
       tree.insert(root, matrix)
       tree.insert(root, inception)
       tree.delete(root, inception.title)
       expect(tree.find(root, inception.title)).to be_nil
     end

     it "properly deletes a right-right node" do
       tree.insert(root, braveheart)
       tree.insert(root, jedi)
       tree.insert(root, donnie)
       tree.insert(root, matrix)
       tree.insert(root, inception)
       tree.insert(root, district)
       tree.delete(root, district.title)
       expect(tree.find(root, district.title)).to be_nil
     end
   end

   describe "#printf" do
      specify {
        expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nDonnie Darko: 85\nThe Matrix: 87\nInception: 86\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
        tree.insert(root, braveheart)
        tree.insert(root, jedi)
        tree.insert(root, donnie)
        tree.insert(root, matrix)
        tree.insert(root, inception)
        tree.insert(root, district)
        tree.insert(root, shawshank)
        tree.insert(root, martian)
        tree.insert(root, hope)
        tree.insert(root, empire)
        tree.insert(root, mad_max_2)
        tree.printf
        expect { tree.printf }.to output(expected_output).to_stdout
      }

      specify {
        expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nDistrict 9: 90\nDonnie Darko: 85\nInception: 86\nThe Matrix: 87\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
        tree.insert(root, jedi)
        tree.insert(root, braveheart)
        tree.insert(root, shawshank)
        tree.insert(root, donnie)
        tree.insert(root, inception)
        tree.insert(root, matrix)
        tree.insert(root, district)
        tree.insert(root, martian)
        tree.insert(root, hope)
        tree.insert(root, empire)
        tree.insert(root, mad_max_2)
        expect { tree.printf }.to output(expected_output).to_stdout
      }
   end
end
