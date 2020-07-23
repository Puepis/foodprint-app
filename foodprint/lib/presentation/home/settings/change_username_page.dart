import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/account/account_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/presentation/common/buttons.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

class ChangeUsernamePage extends StatefulWidget {
  final JWT token;
  static const routeName = "/change_username";
  const ChangeUsernamePage({Key key, @required this.token}) : super(key: key);

  @override
  _ChangeUsernamePageState createState() => _ChangeUsernamePageState();
}

class _ChangeUsernamePageState extends State<ChangeUsernamePage> {
  final _formKey = GlobalKey<FormState>();
  String newUsername;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Change Username"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocListener<AccountBloc, AccountState>(
        listener: (context, state) {
          if (state is UsernameChangeError) {
            Scaffold.of(context)..hideCurrentSnackBar();
            FlushbarHelper.createError(
              message: state.failure.maybeMap(
                  usernameTaken: (_) => 'Username already taken',
                  serverError: (_) => 'Server Error',
                  orElse: () => 'Unexpected error'),
            ).show(context);
          }

          if (state is UsernameChangeSuccess) {
            context
                .bloc<AuthBloc>()
                .add(AuthEvent.refreshAccount(token: state.token));
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "New Username",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                    ),
                    onSaved: (value) => newUsername = value,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a username';
                      } else if (value.length > 20) {
                        return 'Username must not be longer than 20 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AuthIdleButton(
                    title: "Save",
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();

                        context.bloc<AccountBloc>().add(AccountUsernameChanged(
                            token: widget.token, newUsername: newUsername));
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
