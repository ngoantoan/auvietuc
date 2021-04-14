function BrowseImageFromServer(startupPath, functionData) {
    var finder = new CKFinder();
    finder.basePath = ckfinder_path;
    finder.startupPath = startupPath;
    finder.selectActionFunction = SetBrowseImageFromServerField;
    finder.selectActionData = functionData;
    finder.popup();
};

function SetBrowseImageFromServerField(fileUrl, data) {
    document.getElementById(data["selectActionData"]).value = fileUrl.replace(site_folder + "/upload/images/", '');
};

// full link upload image
function BrowseImageFromServerFullLink(startupPath, functionData) {
    var finder = new CKFinder();
    finder.basePath = ckfinder_path;
    finder.startupPath = startupPath;
    finder.selectActionFunction = SetBrowseImageFromServerFieldFullLink;
    finder.selectActionData = functionData;
    finder.popup();
};

function SetBrowseImageFromServerFieldFullLink(fileUrl, data) {
    document.getElementById(data["selectActionData"]).value = 'http://www.auvietuc.edu.vn' + fileUrl;
};
// full link upload image

function BrowseFileFromServer(startupPath, functionData) {
    var finder = new CKFinder();
    finder.basePath = ckfinder_path;
    finder.startupPath = startupPath;
    finder.selectActionFunction = SetBrowseFileFromServerField;
    finder.selectActionData = functionData;
    finder.popup();
};

function SetBrowseFileFromServerField(fileUrl, data) {
    document.getElementById(data["selectActionData"]).value = fileUrl.replace(site_folder + "/upload/files/", '');
};

// full link uplaod file
function BrowseFileFromServerFullLink(startupPath, functionData) {
    var finder = new CKFinder();
    finder.basePath = ckfinder_path;
    finder.startupPath = startupPath;
    finder.selectActionFunction = SetBrowseFileFromServerFieldFullLink;
    finder.selectActionData = functionData;
    finder.popup();
};

function SetBrowseFileFromServerFieldFullLink(fileUrl, data) {
    document.getElementById(data["selectActionData"]).value = 'http://www.auvietuc.edu.vn' + fileUrl;
};
// full link uplaod file

function reloadList(gridId) {
    self.parent.jQuery(gridId).trigger("reloadGrid");
    return true;
};

function CKupdate(){
    for ( instance in CKEDITOR.instances ) {
        CKEDITOR.instances[instance].updateElement();
    }
    $('textarea').trigger('keyup');
    return true;
}
function getCK_source(elements){
    CKEDITOR.replace(elements, {
        toolbar : 'Full',
        height : 400,
        filebrowserBrowseUrl : ckfinder_path + 'ckfinder.html',
        filebrowserImageBrowseUrl : ckfinder_path + 'ckfinder.html?Type=images',
        filebrowserFlashBrowseUrl : ckfinder_path + 'ckfinder.html?Type=flash',
        filebrowserUploadUrl : ckfinder_path + 'coreconnector/php/connector.php?command=QuickUpload&type=files',
        filebrowserImageUploadUrl : ckfinder_path + 'core/connector/php/connector.php?command=QuickUpload&type=images',
    });
}
