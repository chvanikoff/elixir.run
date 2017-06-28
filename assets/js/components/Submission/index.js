import React from "react";
import { connect } from "react-redux";
import classNames from "classnames";

import SubmissionCard from "components/Submission/Card";

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
    return <div className="column is-3"> 
      <SubmissionCard onClick={this.handleOpen} />
      <div className={modalClass}>
        <div className="modal-background" onClick={this.handleClose}></div>
        <div className="modal-content">
          <div className="box">
            <div className="field">
              <label className="label">*Application Name:</label>
              <p className="control">
                <input
                  name="name"
                  value={this.state.form.name}
                  onChange={this.handleInputChange}
                  className="input"
                  type="text"
                  placeholder="Awesome App Name" />
              </p>
            </div>
            <div className="field">
              <label className="label">Demo URL:</label>
              <p className="control">
                <input
                  name="demo_url"
                  value={this.state.form.demo_url}
                  onChange={this.handleInputChange}
                  className="input"
                  type="text"
                  placeholder="https://awesome.app" />
              </p>
            </div>
            <div className="field">
              <label className="label">*Source code URL::</label>
              <p className="control">
                <input
                  name="source_url"
                  value={this.state.form.source_url}
                  onChange={this.handleInputChange}
                  className="input"
                  type="text"
                  placeholder="https://github.com/superduper/megaapp" />
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
              <p className="control">
                <textarea
                  name="description"
                  value={this.state.form.description}
                  onChange={this.handleInputChange}
                  className="textarea"
                  placeholder="The Awesome App Description" />
              </p>
            </div>
            <div className="field is-grouped">
              <p className="control">
                <button className="button is-dark" onClick={this.handleFormSubmit}>Submit</button>
              </p>
              <p className="control">
                <button className="button is-link" onClick={this.handleClose}>Cancel</button>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>;
  }

  handleOpen() {
    this.setState({ isOpen: true });
  }

  handleClose() {
    this.setState({ isOpen: false });
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
  }
};

const mapStateToProps = (state) => ({
});

export default connect(mapStateToProps)(Submission);
