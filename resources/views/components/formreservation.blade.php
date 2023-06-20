<div>

<section class="regervation_part section_padding" id="reservation">
    <div class="container">
        <div class="row">
            <div class="col-xl-5">
                <div class="section_tittle">
                    <p>Reservation</p>
                    <h2>Book A Table</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="regervation_part_iner">
                    <form method="POST" action="{{ route('reservation') }}" >
                        @csrf
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <input type="text" class="form-control" name="fullname" id="inputEmail4" placeholder="Name *" minlength="5" required>
                                @error('fullname')
                                <span class="invalid-feedback d-flex" role="alert">
                                     <strong>{{ $message }}</strong>
                                </span>
                               @enderror
                            </div>
                            <div class="form-group col-md-6">
                                <input type="email" class="form-control" name="email" id="inputPassword4"
                                    placeholder="Email address *"  required>
                                    @error('email')
                                    <span class="invalid-feedback d-flex" role="alert">
                                         <strong>{{ $message }}</strong>
                                    </span>
                                   @enderror
                            </div>
                            <div class="form-group col-md-6">
                                <select class="form-control" id="Select" name="persons" required>
                                    <option value="0" selected>Persons *</option>
                                    <option value="1">Number of guests 1</option>
                                    <option value="2">Number of guests 2</option>
                                    <option value="3">Number of guests 3</option>
                                    <option value="4">Number of guests 4</option>
                                </select>
                                @error('persons')
                                <span class="invalid-feedback d-flex" role="alert">
                                     <strong>{{ $message }}</strong>
                                </span>
                               @enderror
                            </div>
                            <div class="form-group col-md-6">
                                <input type="text" class="form-control" name="phone" id="phone" placeholder="Phone number *" minlength="10" maxlength="10" required>
                            </div>
                            <div class="form-group col-md-6">
                                <div class="input-group date">
                                    <input id="datepicker" type="text" name="date" class="form-control" placeholder="Date *" />
                                    @error('date')
                                    <span class="invalid-feedback d-flex" role="alert">
                                         <strong>{{ $message }}</strong>
                                    </span>
                                   @enderror
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <select class="form-control" id="Select2" name="time" required>
                                    <option value="" selected>Time *</option>
                                    <option value="8AM TO 10AM">8 AM TO 10AM</option>
                                    <option value="10AM TO 12PM">10 AM TO 12PM</option>
                                    <option value="12PM TO 2PM">12PM TO 2PM</option>
                                    <option value="2PM TO 4PM">2PM TO 4PM</option>
                                    <option value="4PM TO 6PM">4PM TO 6PM</option>
                                    <option value="6PM TO 8PM">6PM TO 8PM</option>
                                    <option value="4PM TO 10PM">4PM TO 10PM</option>
                                    <option value="10PM TO 12PM">10PM TO 12PM</option>
                                </select>
                                @error('time')
                                <span class="invalid-feedback d-flex" role="alert">
                                     <strong>{{ $message }}</strong>
                                </span>
                               @enderror
                            </div>
                            <div class="form-group col-md-12">
                                <select class="form-control" id="Select_table" name="numtable" required>
                                    <option value="" selected>Tables *</option>
                                    @foreach ( $tables as $table )
                                    <option value="{{ $table->id }}">{{ $table->table }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-md-12">
                                <textarea class="form-control" id="Textarea" rows="4" name="note"
                                    placeholder="Your Note *" minlength="10" maxlength="1000"></textarea>
                                    @error('note')
                                    <span class="invalid-feedback d-flex" role="alert">
                                         <strong>{{ $message }}</strong>
                                    </span>
                                   @enderror
                                </div>
                        </div>


                        <div class="regerv_btn">
                            <button class="btn_4" type="submit" @if ($tables->isEmpty()) disabled @endif >Book A Table</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
</div>