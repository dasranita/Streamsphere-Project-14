from main import Request,rank
def test_fallback():
    assert rank(Request(catalog=[{'id':1,'category':'a','popularity':1},{'id':2,'category':'b','popularity':2}]))[0].id==2
