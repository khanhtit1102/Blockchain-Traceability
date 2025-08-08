<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use TCG\Voyager\Models\Category;
use TCG\Voyager\Models\Post;

class PostController extends Controller
{
    public function index()
    {
        $pageMeta = [
            'title' => 'Trang chủ',
            'description' => '',
            'keywords' => '',
        ];
        $posts = Post::with('authorId', 'category')->latest()->paginate(setting('site.paginate', '4'));

        // Get all categories and count posts in each category
        $categories = Category::withCount('posts')->get();

        return view('front.posts.index', compact('posts', 'categories', 'pageMeta'));
    }

    public function show($slug)
    {
        $pageMeta = [
            'title' => 'Trang chủ',
            'description' => '',
            'keywords' => '',
        ];
        $post = Post::with('authorId', 'category')->where('slug', $slug)->firstOrFail();
        $categories = Category::withCount('posts')->get();
        // Get some random posts for the sidebar
        $randomPosts = Post::with('authorId', 'category')
            ->where('id', '!=', $post->id)
            ->inRandomOrder()
            ->take(3)
            ->get();

        return view('front.posts.show', compact('post', 'categories', 'randomPosts', 'pageMeta'));
    }
}
