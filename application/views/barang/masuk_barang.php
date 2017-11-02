<div class="row">
                    <div class="col-md-12">
                        <h2 class="page-header">
                            POS (Point of Sale) <small>Barang Masuk</small>
                        </h2>
                    </div>
                </div> 
                <!-- /. ROW  -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <?php echo form_open('barang/masuk'); ?>
                                <div class="form-group">
                                    <label>ID Barang</label>
                                    <input class="form-control" name="barang_id" placeholder="ID Barang">
                                </div>
                                <div class="form-group">
                                    <label>Qty</label>
                                    <input class="form-control" name="qty" placeholder="qty">
                                </div>
                                <button type="submit" name="submit" class="btn btn-primary btn-sm">Simpan</button> | 
                                <?php echo anchor('barang','Kembali',array('class'=>'btn btn-danger btn-sm'))?>
                                </form>
                                <div><label>* Masukkan ID barang.</label></div>
                                <div><label>* 1 = Gas Elpiji 12 kg.</label></div>
                                <div><label>* 2 = Gas Elpiji 3  kg.</label></div>
                                <div><label>* 3 = Gas Elpiji 5  kg.</label></div>
                            </div>
                        </div>
                        <!-- /. PANEL  -->
                    </div>
                </div>
                <!-- /. ROW  -->