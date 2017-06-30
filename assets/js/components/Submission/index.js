import React from "react";
import { connect } from "react-redux";
import classNames from "classnames";

import SubmissionCard from "components/Submission/Card";
import actions from "actions/submission";

class Submission extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      isOpen: false,
      form: {
        name: "",
        demo_url: "",
        source_url: "",
        description: ""
      }
    };
    this.handleOpen = this.handleOpen.bind(this);
    this.handleClose = this.handleClose.bind(this);
    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
  }

  render() {
    const modalClass = classNames("modal", {"is-active": this.state.isOpen});
    const boxContent = this.props.success
      ? this.boxSuccess()
      : this.boxForm()
    return <div className="column is-3 app-column"> 
      <SubmissionCard onClick={this.handleOpen} />
      <div className={modalClass}>
        <div className="modal-background" onClick={this.handleClose}></div>
        <div className="modal-content">
          {boxContent}
        </div>
      </div>
    </div>;
  }

  boxForm() {
    const controlClass = classNames("control", {"is-loading": this.props.processing});
    const inputClass = (field, base_class = "input") => {
      return classNames(base_class, {"is-danger": this.props.errors[field]});
    };
    const errorsFor = field => {
      const errors = this.props.errors[field];
      if ( ! errors) {
        return null;
      }
      return <ul>
        {errors.map((error) => {
          return <li key={`error_${field}`}>
            {error}
          </li>
        })}
      </ul>;
    };
    return <div className="box">
      <div className="field">
        <label className="label">*Application Name:</label>
        <p className={controlClass}>
          <input
            name="name"
            disabled={this.props.processing}
            value={this.state.form.name}
            onChange={this.handleInputChange}
            className={inputClass("name")}
            type="text"
            placeholder="Awesome App Name" />
        </p>
        <p className="help is-danger">
          {errorsFor("name")}
        </p>
      </div>
      <div className="field">
        <label className="label">Demo URL:</label>
        <p className={controlClass}>
          <input
            name="demo_url"
            disabled={this.props.processing}
            value={this.state.form.demo_url}
            onChange={this.handleInputChange}
            className={inputClass("demo_url")}
            type="text"
            placeholder="https://awesome.app" />
        </p>
        <p className="help is-danger">
          {errorsFor("demo_url")}
        </p>
      </div>
      <div className="field">
        <label className="label">*Source code URL::</label>
        <p className={controlClass}>
          <input
            name="source_url"
            disabled={this.props.processing}
            value={this.state.form.source_url}
            onChange={this.handleInputChange}
            className={inputClass("source_url")}
            type="text"
            placeholder="https://github.com/superduper/megaapp" />
        </p>
        <p className="help is-danger">
          {errorsFor("source_url")}
        </p>
      </div>
      <div className="field">
        <label className="label">Logo or preview image:</label>
        <p className="control">
          <input
            ref="image_url"
            type="hidden"
            role="uploadcare-uploader"
            data-crop="disabled"
            data-images-only="true" />
        </p>
      </div>
      <div className="field">
        <label className="label">*Description:</label>
        <p className={controlClass}>
          <textarea
            disabled={this.props.processing}
            name="description"
            value={this.state.form.description}
            onChange={this.handleInputChange}
            className={inputClass("description", "textarea")}
            placeholder="The Awesome App Description" />
        </p>
        <p className="help is-danger">
          {errorsFor("description")}
        </p>
      </div>
      <div className="field is-grouped">
        <p className="control">
          <button className="button is-dark" onClick={this.handleFormSubmit} disabled={this.props.processing}>Submit</button>
        </p>
        <p className="control">
          <button className="button is-link" onClick={this.handleClose} disabled={this.props.processing}>Cancel</button>
        </p>
      </div>
    </div>
  }

  boxSuccess() {
    return <div className="box has-text-centered">
      <div className="title is-3">
        Application was succesfully submitted!
      </div>
      <div className="title is-3">
        It will appear on the list shortly!
      </div>
      <div>
        <button className="button is-success" onClick={this.handleClose}>Back to the list</button>
      </div>
    </div>;
  }

  handleOpen() {
    this.setState({ isOpen: true });
  }

  handleClose() {
    this.setState({ isOpen: false });
    if (this.props.success) {
      this.props.dispatch({ type: "SUBMISSION_RESET" });

      this.setState({form: {
        name: "",
        demo_url: "",
        source_url: "",
        description: ""
      }});
    }
  }

  handleInputChange(event) {
    const name = event.target.name;
    const value = event.target.value;

    this.setState({
      form: {
        ...this.state.form,
        [name]: value
      }
    });
  }

  handleFormSubmit(event) {
    event.preventDefault();

    const params = {
      ...this.state.form,
      image_url: this.refs.image_url.value
    };
    this.props.dispatch(actions.submit(params));
  }
};

const mapStateToProps = (state) => ({
  processing: state.submission.processing,
  success: state.submission.success,
  errors: state.submission.errors
});

export default connect(mapStateToProps)(Submission);
