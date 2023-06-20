<ul class="navbar-nav">
   {{-- <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Blog
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="blog.html">Blog</a>
            <a class="dropdown-item" href="single-blog.html">Single blog</a>
            <a class="dropdown-item" href="elements.html">Elements</a>
        </div>
    </li> --}}
     @foreach($items as $menu_item)

        @if ($menu_item->title == 'Blog')
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                {{$menu_item->title}}
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              @foreach ($menu_item->children as $item)
              
              <a class="dropdown-item" href="{{ $item->link() }}">{{ $item->title }}</a>
              @endforeach

            </div>
        </li>
       @else
        <li class="nav-item">
            <a class="nav-link" href="{{ $menu_item->url }}">{{ $menu_item->title }}</a>
        </li>
       @endif
     
        
     @endforeach
</ul>

