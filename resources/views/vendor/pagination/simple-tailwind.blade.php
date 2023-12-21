@if ($paginator->hasPages())
    <nav role="navigation" aria-label="Pagination Navigation" class="col d-flex justify-content-center">
        <div class="pagination d-flex justify-content-center  align-items-center">
        {{-- Previous Page Link --}}
        @if ($paginator->onFirstPage())
            <span class="btn btn-dark-light rounded">
                <i class="fi-rr-arrow-alt-left"></i>
            </span>
        @else
            <a href="{{ $paginator->previousPageUrl() }}" rel="prev" class="btn btn-dark rounded">
                <i class="fi-rr-arrow-alt-left"></i>
            </a>
        @endif
        <p>View More</p>
        {{-- Next Page Link --}}
        @if ($paginator->hasMorePages())
            <a href="{{ $paginator->nextPageUrl() }}" rel="next" class="btn btn-dark rounded">
                <i class="fi-rr-arrow-alt-right"></i>
            </a>
        @else
            <span class="btn btn-dark-light rounded">
                <i class="fi-rr-arrow-alt-right"></i>
            </span>
        @endif
    </div>
    </nav>
    
@endif
