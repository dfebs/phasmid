module BugsHelper
  def get_bug_score(bug)
    bug.tags.map { |tag| tag.weight }.reduce(1.0) { |score, weight| weight * score }.floor
  end
end
