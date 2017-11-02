                <div class="row">
                    <div class="col-md-12">
                        <h2 class="page-header">
                            POS (Point of Sale) <small>Data Pelanggan</small>
                        </h2>
                    </div>
                </div> 
                <!-- /. ROW  -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Sub Penyalur</th>
                                                <th>Alamat</th>
                                                <th>Qty/Bulan</th>
                                                <th>Telepon</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <?php $no=1; foreach ($record->result() as $r) { ?>
                                            <tr class="gradeU">
                                                <td><?php echo $no ?></td>
                                                <td><?php echo $r->Sub_Penyalur ?></td>
                                                <td><?php echo $r->Alamat ?></td>
                                                <td><?php echo $r->Qty_Kontrak ?></td>
                                                <td>0<?php echo $r->Tlp_Kantor ?></td>
                                                <td class=" btn-success btn-sm"><?php echo $r->Status ?></td>

                                                
                                                
                                        <?php $no++; } ?>
                                        </tbody>
                                    </table>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /. ROW  -->