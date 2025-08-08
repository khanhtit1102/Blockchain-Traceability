@extends('front.layouts.main')

@section('css')
    <style>
        .page-header {
            background: white;
            padding: 1.5rem 2rem;
            margin-top: 2rem;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
        }

        .view-switcher .btn {
            background-color: #e9ecef;
            color: var(--dark-text);
            border: none;
        }

        .view-switcher .btn.active {
            background-color: var(--primary-color);
            color: white;
        }

        .article-card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .article-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, .1);
        }

        .article-card .card-img-top {
            border-radius: 12px 12px 0 0;
            object-fit: cover;
            aspect-ratio: 16 / 10;
        }

        .article-card .card-body {
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .article-card .card-title {
            font-weight: 700;
            color: var(--dark-text);
        }

        .article-card .card-title a {
            color: inherit;
            text-decoration: none;
        }

        .article-card .card-text {
            color: var(--light-text);
            font-size: 0.95rem;
        }

        .article-category {
            font-size: 0.8rem;
            font-weight: 500;
            color: var(--primary-color);
            background-color: var(--light-primary-color);
            padding: 3px 10px;
            border-radius: 15px;
            display: inline-block;
        }

        .author-info {
            display: flex;
            align-items: center;
            font-size: 0.9rem;
            color: var(--light-text);
            margin-top: auto;
            /* Đẩy phần này xuống cuối card */
        }

        .author-info img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-right: 10px;
        }

        /* --- STYLES CHO LIST VIEW --- */
        .list-view .article-item .article-card {
            flex-direction: row;
        }

        .list-view .article-item .card-img-container {
            width: 250px;
            flex-shrink: 0;
        }

        .list-view .article-item .card-img-top {
            border-radius: 12px 0 0 12px;
            width: 100%;
            height: 100%;
        }

        /* --- PAGINATION STYLES --- */
        .pagination .page-item .page-link {
            color: var(--primary-color);
            border: none;
            background-color: #fff;
            margin: 0 5px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, .05);
            transition: all 0.3s ease;
        }

        .pagination .page-item .page-link:hover {
            background-color: var(--light-primary-color);
            transform: translateY(-2px);
        }

        .pagination .page-item.active .page-link {
            background-color: var(--primary-color);
            color: white;
            box-shadow: 0 4px 8px rgba(0, 121, 107, 0.3);
            transform: translateY(-2px);
        }

        .pagination .page-item.disabled .page-link {
            color: #adb5bd;
            background-color: #e9ecef;
            box-shadow: none;
        }

        .pagination .page-item.disabled .page-link:hover {
            transform: none;
        }

        /* --- SIDEBAR WIDGET STYLES --- */
        .sidebar .widget {
            background: #fff;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, .07);
            margin-bottom: 2rem;
        }

        .sidebar .widget-title {
            font-family: var(--heading-font);
            font-size: 1.2rem;
            font-weight: 700;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
        }

        .sidebar .category-list li a {
            text-decoration: none;
            color: var(--dark-text);
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .sidebar .category-list li a:hover {
            color: var(--primary-color);
        }

        .sidebar #blog-search-input:focus {
            box-shadow: 0 0 0 0.25rem var(--light-primary-color);
            border-color: var(--primary-color);
        }
    </style>
@endsection

@section('content')
    <main class="container">
        <div class="row">
            <!-- ========= MAIN CONTENT (BLOG LIST) ========= -->
            <div class="col-lg-8">
                <!-- HEADER CỦA TRANG BLOG -->
                <section class="page-header d-flex justify-content-between align-items-center">
                    <div>
                        <h2 class="mb-0">Tin Tức & Bài Viết</h2>
                        <p class="mb-0 text-muted">Cập nhật các kiến thức mới nhất về công nghệ và nông nghiệp</p>
                    </div>
                    <div class="view-switcher btn-group" role="group">
                        <button type="button" id="btn-grid-view" class="btn active" title="Hiển thị dạng lưới"><i
                                class="fa-solid fa-grip"></i></button>
                        <button type="button" id="btn-list-view" class="btn" title="Hiển thị dạng danh sách"><i
                                class="fa-solid fa-list"></i></button>
                    </div>
                </section>

                <!-- DANH SÁCH BÀI VIẾT -->
                <section class="mt-4">
                    <div id="article-list-container" class="row g-4 grid-view">
                        @foreach ($posts as $post)
                            <div class="article-item col-lg-6 col-md-6">
                                <div class="article-card">
                                    <div class="card-img-container"><img
                                            src="{{ $post->image ? Voyager::image($post->image) : asset('resources/images/Image_not_available.png') }}"
                                            class="card-img-top" alt="Ảnh bài viết"></div>
                                    <div class="card-body p-4">
                                        <div>
                                            <span
                                                class="article-category">{{ $post->category ? $post->category->name : '' }}</span>
                                            <h5 class="card-title mt-2"><a
                                                    href="{{ route('posts.show', $post->slug) }}">{{ $post->title }}</a>
                                            </h5>
                                            <p class="card-text">{{ $post->excerpt }}</p>
                                        </div>
                                        <div class="author-info mt-3"><img
                                                src="{{ $post->authorId ? Voyager::image($post->authorId->avatar) : asset('resources/images/Image_not_available.png') }}"
                                                alt="{{ $post->authorId ? $post->authorId->name : '' }}">
                                            <div>
                                                <strong>{{ $post->authorId ? $post->authorId->name : '' }}</strong><br><span
                                                    class="small">{{ $post->created_at->format('d/m/Y') }}</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </section>

                @if ($posts->hasPages())
                    <section class="mt-5 d-flex justify-content-center">
                        {{ $posts->appends(request()->input())->onEachSide(1)->links('pagination::post-pagination') }}
                    </section>
                @endif
            </div>

            <!-- ========= SIDEBAR ========= -->
            <aside class="col-lg-4">
                <div class="sidebar mt-5 mt-lg-0">
                    <!-- WIDGET TÌM KIẾM -->
                    <div class="widget">
                        <h3 class="widget-title">Tìm Kiếm</h3>
                        <form action="#" method="GET">
                            <div class="input-group">
                                <input type="text" id="blog-search-input" name="keyword" class="form-control"
                                    placeholder="Nhập từ khóa...">
                                <button class="btn" type="submit"
                                    style="background-color: var(--primary-color); color: white;"><i
                                        class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </form>
                    </div>

                    <!-- WIDGET CHUYÊN MỤC -->
                    <div class="widget">
                        <h3 class="widget-title">Chuyên Mục</h3>
                        <ul class="list-unstyled category-list">
                            @foreach ($categories as $category)
                                <li class="mb-2 d-flex justify-content-between align-items-center">
                                    {{-- <a href="{{ route('posts.category', $category->slug) }}">{{ $category->name }}</a> --}}
                                    <a href="#">{{ $category->name }}</a>
                                    <span class="badge bg-primary-subtle text-primary-emphasis rounded-pill">
                                        {{ $category->posts_count }}
                                    </span>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </aside>
        </div>
    </main>
@endsection

@section('js')
    <script>
        $(document).ready(function() {
            // --- VIEW SWITCHER ---
            const container = $('#article-list-container');
            const articles = container.find('.article-item');

            $('#btn-grid-view').on('click', function() {
                container.removeClass('list-view').addClass('grid-view');
                // Sửa lại class cho grid view trên màn hình lớn và vừa
                articles.removeClass('col-12').addClass('col-lg-6 col-md-6');
                $(this).addClass('active').siblings().removeClass('active');
            });

            $('#btn-list-view').on('click', function() {
                container.removeClass('grid-view').addClass('list-view');
                // Sửa lại class cho list view
                articles.removeClass('col-lg-6 col-md-6').addClass('col-12');
                $(this).addClass('active').siblings().removeClass('active');
            });
        });
    </script>
@endsection
