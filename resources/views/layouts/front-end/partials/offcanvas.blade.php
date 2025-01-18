<style>
    .se-product-res>img {
        width: 90px;
        height: 103px;
        margin-bottom: 10px;
        border-radius: 5px;
    }

    .se-product-content-res>h5 {
        color: #000;
        font-size: 16px;
        margin: 0;
    }

    .se-product-content-res>p {
        color: #000;
        font-size: 17px;
        margin: 0;
    }
</style>
<div class="offcanvas offcanvas-end" tabindex="-1" id="searchOffcanvas" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasExampleLabel">SEARCH OUR SITE</h5>
        <i class="fa fa-close offcanvasClose" data-bs-dismiss="offcanvas" aria-label="Close"></i>
    </div>
    <div class="offcanvas-body">
        <div class="row">
            <div class="col-md-12">
                <form action="{{ route('products') }}" type="submit" class="search_form">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Search your product" name="name"
                            id="searchInput">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                    <input name="data_from" value="search" hidden>
                    <input name="page" value="1" hidden>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="offcanva-search-title">
                    <h4>Search Results:</h4>
                </div>
            </div>
            <div class="col-12 mb-3">
                <div id="searchResultProducts"></div>
            </div>
            <div class="col-12">
                <div id="searchResultCategories"></div>
            </div>
        </div>
    </div>
</div>
<!------End Search canva-->
