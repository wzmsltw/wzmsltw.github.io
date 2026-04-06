require "minitest/autorun"

class SiteSourceTest < Minitest::Test
  ROOT = File.expand_path("..", __dir__)

  def read(path)
    File.read(File.join(ROOT, path))
  end

  def test_homepage_source_matches_latest_highlights
    homepage = read("index.md")

    assert_includes homepage, "homepage: true"
    assert_includes homepage, 'class="home-hero"'
    assert_includes homepage, 'class="hero-links-row"'
    assert_equal 6, homepage.scan('class="publication-card"').size
    assert_equal 5, homepage.scan('class="news-item"').size
    assert_includes homepage, 'class="visit-counter"'
    assert_includes homepage, 'counter12.com/img-Z30Y6ACw1CW4cDZ6-50.gif'
    assert_includes homepage, 'src="{{ BASE_PATH }}/icons16/github-icon.png"'
    assert_includes homepage, 'class="hero-link-glyph"'
    assert_includes homepage, 'HoloBrain-0'
    assert_includes homepage, 'RISE'
    assert_includes homepage, 'Planning-oriented Autonomous Driving'
    assert_includes homepage, 'Paint transformer'
    assert_includes homepage, 'Boundary Sensitive Network'
    assert_includes homepage, 'Boundary Matching Network'
    refute_includes homepage, 'WidthFormer</h3>'
    refute_includes homepage, 'Focus on your instruction'
    refute_includes homepage, 'Symphonize 3d semantic scene completion'
    refute_includes homepage, 'class="section-kicker"'
    refute_includes homepage, '>CV<'
    refute_includes homepage, 'counter12.com/ad.js'
  end

  def test_publications_source_has_expanded_archive_by_bibtex_year
    publications = read("pages/pubs.md")

    assert_includes publications, "body_class: publications-page"
    assert_equal 11, publications.scan('class="publication-year"').size
    assert_equal 34, publications.scan('class="publication-entry"').size
    assert_includes publications, '<h2>2026</h2>'
    assert_includes publications, '<h2>2025</h2>'
    assert_includes publications, 'HoloBrain-0 Technical Report'
    assert_includes publications, 'RISE: Self-Improving Robot Policy with Compositional World Model'
    assert_includes publications, 'Sem: Enhancing spatial understanding for robust robot manipulation'
    assert_includes publications, 'H-rdt: Human manipulation enhanced bimanual robotic manipulation'
    assert_includes publications, 'Finegrasp: Towards robust grasping for delicate objects'
    assert_includes publications, 'Generating multimodal driving scenes via next-scene prediction'
    assert_includes publications, 'Gausstr: Foundation model-aligned gaussian transformer for self-supervised 3d spatial understanding'
    assert_includes publications, 'Bip3d: Bridging 2d images and 3d perception for embodied intelligence'
    assert_includes publications, 'Gls: Geometry-aware 3d language gaussian splatting'
    assert_includes publications, 'pic_2026_holobrain.png'
    assert_includes publications, 'pic_2026_rise.png'
    assert_includes publications, 'pic_2025_sem.png'
    assert_includes publications, 'pic_2025_hrdt.png'
    assert_includes publications, 'pic_2025_finegrasp.png'
    assert_includes publications, 'pic_2025_umgen.png'
    assert_includes publications, 'pic_2025_gausstr.png'
    assert_includes publications, 'pic_2024_sem.png'
    assert_includes publications, 'pic_2024_gls.jpg'
    assert_includes publications, 'https://arxiv.org/abs/2602.12062'
    assert_includes publications, 'https://github.com/HorizonRobotics/RoboOrchardLab/tree/master/projects/holobrain'
    assert_includes publications, 'https://embodiedfoundation.github.io/hrdt'
    assert_includes publications, 'https://github.com/HorizonRobotics/BIP3D'
    refute_includes publications, 'This page keeps the complete publication archive.'
  end

  def test_shared_layout_and_404_links_are_updated
    layout = read("_includes/themes/twitter/default.html")
    not_found = read("404.md")
    stylesheet = read("assets/themes/twitter/css/homepage.css")

    assert_includes layout, "homepage.css"
    assert_includes layout, "/pages/pubs.html"
    refute_includes layout, "/assets/cv_ltw.pdf"
    assert_includes not_found, "/#contact"
    assert_includes stylesheet, ".hero-links-row"
    assert_includes stylesheet, ".visit-counter"
    assert_includes stylesheet, ".hero-link-glyph"
    assert_includes stylesheet, "grid-template-columns: repeat(2, minmax(0, 1fr));"
    assert_includes stylesheet, "font-size: clamp(1.75rem, 3.4vw, 2.35rem);"
    assert_includes stylesheet, "@media (max-width: 900px)"
  end
end
