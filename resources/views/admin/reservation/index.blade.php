@extends ('voyager::master')

@section('page_title', __('voyager::generic.viewing').' '.__('voyager::generic.reservation'))

@section('css')
<style>
    .list_items li {
        display: flex;
        padding: 6px 0 5px 0;
        width: 90%;
    }

    .list_items li span {
        color: darkblue;
        font-weight: 600;
        width: 60%;
    }

    .list_items li b {
        width: 30%;
    }

    .modal-header {
        background-color: #62a8ea;
        display: flex;
        justify-content: space-between;
    }

    .modal-title {
        color: white;
        width: 50%;
    }

    .modal-header button {
        width: 50%;
        text-align: end;
    }
</style>
@stop

@section('page_header')
<h1 class="page-title">
    <i class="voyager-news"></i> Reservation
</h1>
@stop
@section('content')
<div class="col-md-12">
    <div class="panel panel-bordered">
        <div class="panel-body">
            <div class="table-responsive">
                <div id="dataTable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="dataTables_length" id="dataTable_length"><label>Show <select name="dataTable_length" aria-controls="dataTable" class="form-control input-sm">
                                        <option value="10">10</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select> entries</label></div>
                        </div>
                        <div class="col-sm-6">
                            <div id="dataTable_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control input-sm" placeholder="" aria-controls="dataTable"></label></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="dataTable" class="table table-hover dataTable no-footer" role="grid" aria-describedby="dataTable_info">
                                <thead>
                                    <tr role="row">
                                        <th class="dt-not-orderable sorting_disabled" rowspan="1" colspan="1" aria-label="
                                    
                                " style="width: 47.641px;">
                                            <input type="checkbox" class="select_all">
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="
                                                                            Order
                                                                        : activate to sort column ascending" style="width: 91.6103px;">
                                            Order
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="
                                                                            Name
                                                                        : activate to sort column ascending" style="width: 113.282px;">
                                            Table
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="
                                                                            Slug
                                                                        : activate to sort column ascending" style="width: 111.282px;">
                                            Full Name
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="
                                                                            Slug
                                                                        : activate to sort column ascending" style="width: 111.282px;">
                                            Email
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="
                                                                            Slug
                                                                        : activate to sort column ascending" style="width: 111.282px;">
                                            Personnes
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="
                                                                            Slug
                                                                        : activate to sort column ascending" style="width: 111.282px;">
                                            Tél
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="
                                                                            Slug
                                                                        : activate to sort column ascending" style="width: 111.282px;">
                                            Date
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="
                                                                            Slug
                                                                        : activate to sort column ascending" style="width: 111.282px;">
                                            Time
                                        </th>
                                        <th class="actions text-right dt-not-orderable sorting_disabled" rowspan="1" colspan="1" aria-label="Actions" style="width: 338.113px;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    @foreach ($reservations as $reservation)
                                    <tr role="row" class="odd">
                                        <td>
                                            <input type="checkbox" name="row_id" id="checkbox_11" value="11">
                                        </td>
                                        <td>
                                            <div>{{ $reservation->id}}</div>
                                        </td>
                                        <td>
                                            <div>Table {{ $reservation->num_table}}</div>
                                        </td>
                                        <td>
                                            <div>{{ $reservation->fullname}}</div>
                                        </td>
                                        <td>
                                            <div>{{ $reservation->email}}</div>
                                        </td>
                                        <td>
                                            <div>{{ $reservation->personnes}}</div>
                                        </td>
                                        <td>
                                            <div>{{ '0'.$reservation->num_phone}}</div>
                                        </td>
                                        <td>
                                            <div>{{ $reservation->date}}</div>
                                        </td>
                                        <td>
                                            <div>{{ $reservation->time}}</div>
                                        </td>
                                        <td class="no-sort no-click bread-actions">
                                            <button type="button" title="Delete" class="btn btn-sm btn-danger pull-right delete" data-id="{{ $reservation->id }}" id="delete-{{ $reservation->time }}">
                                                <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
                                            </button>
                                            <button type="button" title="View" class="btn btn-sm btn-warning pull-right view" data-id="{{ $reservation->id }}" data-toggle="modal" data-target="#exampleModal">
                                                <i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">View</span>
                                            </button>
                                        </td>
                                    </tr>
                                    @endforeach

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 1 to 10 of 11 entries</div>
                        </div>
                        <div class="col-sm-6">
                            <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                <ul class="pagination">
                                    <li class="paginate_button previous disabled" aria-controls="dataTable" tabindex="0" id="dataTable_previous"><a href="#">Previous</a></li>
                                    <li class="paginate_button active" aria-controls="dataTable" tabindex="0"><a href="#">1</a></li>
                                    <li class="paginate_button " aria-controls="dataTable" tabindex="0"><a href="#">2</a></li>
                                    <li class="paginate_button next" aria-controls="dataTable" tabindex="0" id="dataTable_next"><a href="#">Next</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Reservation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul class="list_items" style="list-style: none;padding: 0;">
                        <li>
                            <b> Numero table : </b> <span id="num_table"></span>
                        </li>
                        <li>
                            <b> Full Name : </b> <span id="name"></span>
                        </li>
                        <li>
                            <b> Email : </b> <span id="email"></span>
                        </li>
                        <li>
                            <b> Personnes : </b> <span id="personnes"></span>
                        </li>
                        <li>
                            <b> Numero Phone : </b> <span id="phone"></span>
                        </li>
                        <li>
                            <b> Date : </b> <span id="date"></span>
                        </li>
                        <li>
                            <b> Time : </b> <span id="time"></span>
                        </li>
                        <li>
                            <b> Note : </b> <span id="note"></span>
                        </li>

                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('javascript')
<script>
    $('document').ready(function() {
        // delete button 
        $btn_delete = $('.delete');
        $btn_delete.click(function(e) {
            e.preventDefault();
            var id = $(this).attr('data-id');
            $.ajax({
                method: 'DELETE',
                url: "http://127.0.0.1:8000/admin/reservations/delete/" + id,
                dataType: 'json',
                success: function(result, status, xhr) {
                       console.log(result.status);
                    if (result) {
                        window.location.reload(true);
                    }
                   // console.log(result.msg);
                },
                error: function(err) {
                    console.log(err)
                }
            });
        });

        // View Button 
        $btn_view = $('.view');
        $btn_view.click(function(e) {
            e.preventDefault();
            var num_table = $('#num_table');
            var name = $('#name');
            var phone = $('#phone');
            var email = $('#email');
            var personnes = $('#personnes');
            var datte = $('#date');
            var time = $('#time');
            var note = $('#note');

            var show_id = $(this).attr('data-id');
            //console.log(show_id)
            $.ajax({
                type: 'GET',
                url: 'http://127.0.0.1:8000/admin/reservations/show/' + show_id,
                dataType: 'json',
                success: function(result) {

                    if (result != "" || result != null) {
                        num_table.text(result.num_table);
                        name.text(result.fullname);
                        phone.text("0" + result.num_phone);
                        email.text(result.email);
                        personnes.text(result.personnes);
                        datte.text(result.date);
                        time.text(result.time);
                        note.text(result.note);
                    }
                },
                error: function(err) {

                    console.log(err)
                }
            });
        })




    })
</script>
@stop